///@desc Check health state for player.
var map = playerMap;
if (hp <= 0) {
	map[? PLAYER_MAP.ALIVE] = false;
	hp = 0;
	map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.DEAD;
	scPlayerDied();
} else
	if (hp <= 2 && hp_flash_alpha == 0) //Pulse health bar
		hp_flash_alpha = 0.75;