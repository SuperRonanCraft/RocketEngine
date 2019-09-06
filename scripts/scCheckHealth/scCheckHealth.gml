///@desc Check health state for player.
var map = player_map;
if (map[? PLAYER_MAP.HEALTH] <= 0) {
	map[? PLAYER_MAP.ALIVE] = false;
	map[? PLAYER_MAP.HEALTH] = 0;
	map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.DEAD;
	scPlayerDied();
} else
	if (map[? PLAYER_MAP.HEALTH] <= 2 && map[? PLAYER_MAP.FLASH_HEALTH_ALPHA] == 0) //Pulse health bar
		map[? PLAYER_MAP.FLASH_HEALTH_ALPHA] = 0.75;