///@desc Check health state for player.

if (hp <= 0) {
	alive = false;
	if(standing)
		playerState = PLAYERSTATE.DEAD;
	scPlayerDied();
}