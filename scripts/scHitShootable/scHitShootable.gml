/// @desc Hit a shootable
/// @arg shooter-instance
/// @arg delete-the-hitting-object
/// @arg play-sound-hit
/// @arg damage

if (argument[0] != id && argument[3] > 0) {
	hp -= argument[3];
	flash = 3;
	hitfrom = other.direction;
	if (argument[1])
		instance_destroy(other.id);
	hpscale = 2;
	//Disabled till sounds are fixed
	/*if (hp >= 0)
		if (argument2) //Play hit sound effect?
			audio_play_sound(SOUND.GP_HIT, 1, false);*/
	if (hp <= 0) {
		alive = false;
		playerState = PLAYERSTATE.DEAD;
		scPlayerDied();
	}
}