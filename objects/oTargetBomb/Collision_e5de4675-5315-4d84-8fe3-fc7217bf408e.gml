/// @desc hit remove hp
if (shootable) {
	with (other)
		event_user(0);
	//Bomb sound effect
	audio_play_sound(SOUND.GP_TARGET_BOMB, 1, false);
	with (oPlayer)
		scHitShootable(other, false, false, 1);
	flash = 10;
	shootable = false;
	timer = 10;
}