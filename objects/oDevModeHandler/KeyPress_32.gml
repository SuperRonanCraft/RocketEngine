/// @desc Heal all entities
with (pEntity) {
	scShootableHeal(id, 50, true, false);
	player_map[? PLAYER_MAP.ALIVE] = true;
	player_map[? PLAYER_MAP.CAN_CONTROL] = true;
	if (player_map[? PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.DEAD)
		player_map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.NORMAL;
}