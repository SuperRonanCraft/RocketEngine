/// @desc touch explosion radius
if (shootable) {
	//Bomb sound effect
	scPlaySound(SOUND.EFFECT_TARGET_BOMB, 1, false);
	with (oPlayer)
		scDamageShootable(other, false, false, 1);
	flash = 5;
	shootable = false;
}