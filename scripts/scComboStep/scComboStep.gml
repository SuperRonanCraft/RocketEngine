with (combo_player)
	if (player_tech && playerState != PLAYERSTATE.KNOCKBACK)
		other.combo_amount = 0;
	else if (standing)
		other.combo_amount = 0;
combo_scale = max(combo_scale * 0.95, 1);

/*if (combo_cooldown_current < combo_cooldown)
	combo_cooldown_current++;
else if (combo_amount > 0) {
	combo_amount--;
	combo_cooldown_current = 0;
}