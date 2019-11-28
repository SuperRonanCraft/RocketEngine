///@desc Check health state for player.
var map = player_map;

shootable_map[? SHOOTABLE_MAP.HEALTH] = shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] + shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR] + shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD];

if (shootable_map[? SHOOTABLE_MAP.HEALTH] <= 0) {
	map[? PLAYER_MAP.ALIVE] = false;
	shootable_map[? SHOOTABLE_MAP.HEALTH] = 0;
	map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.DEAD;
	scPlayerDied();
} else {
	if (shootable_map[? SHOOTABLE_MAP.HEALTH] <= 2 && health_map[? HEALTH_MAP.FLASH_ALPHA] == 0) //Pulse health bar
		health_map[? HEALTH_MAP.FLASH_ALPHA] = 0.75;
	if (shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] < shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL]) {
		if (shootable_map[? SHOOTABLE_MAP.TIME_SINCE_DAMAGE] > room_speed * 2) {
			shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] += 0.02;
		} else
			shootable_map[? SHOOTABLE_MAP.TIME_SINCE_DAMAGE]++;
	}
}