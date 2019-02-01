///@desc Check health state for player.

if (hp <= 0) {
	alive = false;
	if (standing)
		playerState = PLAYERSTATE.DEAD;
	scPlayerDied();
} else
	if (hp <= ceil(hp_original / 10) && hp_flash_alpha == 0)
		hp_flash_alpha = 0.75;