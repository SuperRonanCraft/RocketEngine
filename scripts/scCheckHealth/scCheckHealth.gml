///@desc Check health state for player.
var map = player_map;

shootable_map[? SHOOTABLE_MAP.HEALTH] = shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] + shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR] + shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD];

if (shootable_map[? SHOOTABLE_MAP.HEALTH] <= 0 && map[? PLAYER_MAP.ALIVE]) {
	
	var charMap = map[?PLAYER_MAP.CHARACTER_INFO];
	
	if(!is_undefined(charMap[?CHARACTER_MAP.SOUND_DIE])){
		scPlaySound(charMap[?CHARACTER_MAP.SOUND_DIE], random_range(0.5,2.5));
	}
	
	
	map[? PLAYER_MAP.ALIVE] = false;
	shootable_map[? SHOOTABLE_MAP.HEALTH] = 0;
	map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.DEAD;
	scRemoveFromTeam(id,team);
	scPlayerDied();
	
} else {
	if (shootable_map[? SHOOTABLE_MAP.HEALTH] <= 2 && health_map[? HEALTH_MAP.FLASH_ALPHA] == 0) //Pulse health bar
		health_map[? HEALTH_MAP.FLASH_ALPHA] = 0.75;
	if (shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] < shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL]) {
		if (shootable_map[? SHOOTABLE_MAP.TIME_SINCE_DAMAGE] > room_speed * 2) {
			shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] += 0.035;
			part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left -15, bbox_right+15, bbox_top-15, bbox_bottom+15, ps_shape_ellipse, ps_distr_invgaussian);
			part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SHIELD_RECHARGE], 1);

			health_map[? HEALTH_MAP.HEAL_TIME] = health_map[? HEALTH_MAP.SHOW_TIME];
		} else
			shootable_map[? SHOOTABLE_MAP.TIME_SINCE_DAMAGE]++;
		if (shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] > shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL])
			shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] = shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL];
	}
}