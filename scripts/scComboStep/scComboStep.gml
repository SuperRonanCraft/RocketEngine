if (other.combo_amount > 0)
	with (combo_player)
		if ((player_tech && playerState != PLAYERSTATE.KNOCKBACK) || standing)
			other.combo_amount = 0;