/// @desc hit remove hp
if (shootable) {
	with (other)
		instance_change(oHitSpark, true);
	//Bomb sound effect
	audio_play_sound(SOUND.GP_TARGET_BOMB, 1, false);
	with (oPlayer)
		scHitShootable(other, false, false);
	flash = 10;
	shootable = false;
	timer = 10;
}