//Checks every step

if (knockback_time <= 0) exit; //No knockback, exit
knockback_time--;

//Particles
part_particles_create(global.ParticleSystem1, x, y, oParticleHandler.ds_part[? PARTICLES.KBSMOKE], 1);
//hsp_move = 0;
//animate correctly
var map = playerMap;
if (map[? PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.KNOCKBACK)
	if (sign(facing) == sign(hsp_knockback))
		map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.KNOCKBACK2;
	else
		map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.KNOCKBACK;	

//knockback time was just set to 0, do the following
if (hsp_knockback == 0 || standing || knockback_time == 0) {
	vsp_move += vsp_knockback; //Leave the knockback without instant momentum
	hsp_knockback = 0;
	vsp_knockback = 0;
	knockback_time = 0;
}

if (hsp_knockback == 0 && vsp_knockback == 0 && playerMap[? PLAYER_MAP.ALIVE]){
	map[? PLAYER_MAP.ANIMATION_OVERRIDE] = false;
	map[? PLAYER_MAP.CAN_CONTROL] = true;
	map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.NORMAL;
	knockback_time = 0;
}

//hsp_knockback -= 0.2 * sign(hsp_knockback);
if (abs(hsp_knockback) < 3)
	hsp_knockback = 0;