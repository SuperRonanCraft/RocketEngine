///@desc Check to see if tech is possible/performed
var key_jump = scKeybindsGet(KEYBIND_TYPE.JUMP);

var techPossible = noone;
var map = player_map;

var g_map = gravity_map;
if (map[? PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.KNOCKBACK)
	for (var t = 0; t < 5; t++) {
		//part_particles_create(global.ParticleSystem1,x + (hsp*(t)),y + (vsp*(t)),oParticleHandler.ds_part[?PARTICLES.TEST],1);
		techPossible = instance_place(x + (g_map[? GRAVITY_MAP.HSP] * t), y, oWall);
		if (techPossible == noone)
			techPossible = instance_place(x, y + (g_map[? GRAVITY_MAP.VSP] * t), oWall);
	}


if (map[? PLAYER_MAP.ALIVE] && map[? PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.KNOCKBACK && techPossible != noone)
	if (key_jump) {
		part_particles_create(global.ParticleSystem1, x, y, oParticleHandler.ds_part[? PARTICLES.TECH], 1);
		map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.TECHED;
		map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.TECHED;
			
		g_map[? GRAVITY_MAP.VSP_MOVE] = -sign(g_map[? GRAVITY_MAP.VSP]) * 5;
		g_map[? GRAVITY_MAP.HSP_MOVE] = -sign(g_map[? GRAVITY_MAP.HSP]) * 5;
			
		g_map[? GRAVITY_MAP.VSP_KNOCKBACK] = 0;
		g_map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;
		
		scPlaySound(SOUND.EFFECT_PLAYER_TECH);
	}