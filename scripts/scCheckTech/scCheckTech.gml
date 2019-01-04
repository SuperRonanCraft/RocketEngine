///@desc Check to see if tech is possible/performed
var key_jump = keyboard_check_pressed(keyjump);

var techPossible = noone;

for (var t = 0; t < 2; t++) {
	techPossible = instance_place(x+(hsp*t),y+(vsp*t),oWall);
}


if(alive && playerState == PLAYERSTATE.KNOCKBACK && techPossible != noone){
		if(key_jump){
			part_particles_create(global.ParticleSystem1,x,y,oParticleHandler.ds_part[?PARTICLES.TECH],1);
			playerState = PLAYERSTATE.TECHED;
			animState = ANIMATIONSTATE.TECHED;
			
			vsp_move = -sign(vsp) * 5;
			hsp_move = -sign(hsp) * 5;
			
			vsp_knockback = 0;
			hsp_knockback = 0;
			knockback_time = 0;
		}
}