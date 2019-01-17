/// @desc shot?

// Inherit the parent event
event_inherited();
if (hp <= 0 && damage_take) {
	//Bomb sound effect
	scPlaySound(SOUND.EFFECT_TARGET_BOMB);
	with (shooter)
		scDamageShootable(other, false, false, 1, false);
	//flash = 10;
	damage_take = false;
	timer = 10;
	show_debug_message("BOMB HIT!");
}
