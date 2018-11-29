///@desc Check health state for player.

if (hp <= 0) {
	alive = false;
	playerState = PLAYERSTATE.DEAD;
	scPlayerDied();
}