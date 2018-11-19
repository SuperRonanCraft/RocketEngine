/// @desc touch explosion radius
if (shootable) {
	//Bomb sound effect
	audio_play_sound(SOUND.GP_TARGET_BOMB, 1, false);
	with (oPlayer)
		scHitShootable(other, false, false, 1);
	flash = 5;
	shootable = false;
}