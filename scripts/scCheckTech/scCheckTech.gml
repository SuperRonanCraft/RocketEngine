///@desc Check to see if tech is possible/performed
var key_jump = keyboard_check_pressed(keyjump);

var techPossible = noone;
var map = playerMap;

if (map[? PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.KNOCKBACK)
	for (var t = 0; t < 3; t++) {
		//part_particles_create(global.ParticleSystem1,x + (hsp*(t)),y + (vsp*(t)),oParticleHandler.ds_part[?PARTICLES.TEST],1);
		techPossible = instance_place(x + (hsp * t), y, oWall);
		if (techPossible == noone)
			techPossible = instance_place(x, y + (vsp * t), oWall);
	}


if (map[? PLAYER_MAP.ALIVE] && map[? PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.KNOCKBACK && techPossible != noone)
	if (key_jump) {
		part_particles_create(global.ParticleSystem1, x, y, oParticleHandler.ds_part[?PARTICLES.TECH], 1);
		map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.TECHED;
		map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.TECHED;
			
		vsp_move = -sign(vsp) * 5;
		hsp_move = -sign(hsp) * 5;
			
		vsp_knockback = 0;
		hsp_knockback = 0;
		knockback_time = 0;
	}