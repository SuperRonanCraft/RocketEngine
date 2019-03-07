if (other.combo_amount > 0)
	with (combo_player)
		if ((player_tech && playerMap[? PLAYER_MAP.PLAYER_STATE] != PLAYERSTATE.KNOCKBACK) || standing)
			other.combo_amount = 0;