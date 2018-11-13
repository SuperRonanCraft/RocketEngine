/// @desc hit add score
if (shootable) {
	with (other)
		instance_change(oHitSpark, true);
	with (owner) {
		points_scale += 2;
		points--;
		//Bomb sound effect
		audio_play_sound(SOUND.GP_TARGET_BOMB, 1, false);
	}
	flash = 10;
	shootable = false;
	timer = 10;
}