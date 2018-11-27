/// @desc Hit a shootable
/// @arg shooter-instance
/// @arg delete-the-hitting-object
/// @arg play-sound-hit
/// @arg damage

if (argument0 != id) {
	hp -= argument3;
	flash = 3;
	hitfrom = other.direction;
	if (argument1)
		instance_destroy(other.id);
	hpscale = 2;
	if (hp >= 0)
		if (argument2) //Play hit sound effect?
			audio_play_sound(SOUND.GP_HIT, 1, false);
	if (hp <= 0) {
		alive = false;
		playerState = PLAYERSTATE.DEAD;
		scPlayerDied()
	}
}