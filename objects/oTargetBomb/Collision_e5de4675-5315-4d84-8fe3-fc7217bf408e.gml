/// @desc hit remove hp
if (shootable) {
	with (other)
		event_user(0);
	//Bomb sound effect
	scPlaySound(SOUND.EFFECT_TARGET_BOMB);
	with (oPlayer)
		scHitShootable(other, false, false, 1);
	flash = 10;
	shootable = false;
	timer = 10;
}