//Checks every step

if (knockback_time <= 0) exit; //No knockback, exit
knockback_time--;

//Particles
part_particles_create(global.ParticleSystem1, x, y, oParticleHandler.ds_part[? PARTICLES.KBSMOKE], 1);
//hsp_move = 0;
//animate correctly
if (playerState == PLAYERSTATE.KNOCKBACK)
	if (sign(facing) == sign(hsp_knockback))
		animState = ANIMATIONSTATE.KNOCKBACK2;
	else
		animState = ANIMATIONSTATE.KNOCKBACK;	

//knockback time was just set to 0, do the following
if (hsp_knockback == 0 || standing || knockback_time == 0) {
	vsp_move += vsp_knockback; //Leave the knockback without instant momentum
	hsp_knockback = 0;
	vsp_knockback = 0;
	knockback_time = 0;
}

if (hsp_knockback == 0 && vsp_knockback == 0 && alive){
	overrideAnimation = false;
	canControl = true;
	playerState = PLAYERSTATE.NORMAL;
	knockback_time = 0;
}

//hsp_knockback -= 0.2 * sign(hsp_knockback);
if (abs(hsp_knockback) < 3)
	hsp_knockback = 0;