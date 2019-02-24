///@desc Check health state for player.

if (hp <= 0) {
	alive = false;
	if (standing)
		playerState = PLAYERSTATE.DEAD;
	scPlayerDied();
} else
	if (hp <= 2 && hp_flash_alpha == 0) //Pulse health bar
		hp_flash_alpha = 0.75;