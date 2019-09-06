/// @desc shot?

// Inherit the parent event
event_inherited();
if (shootable_map[? SHOOTABLE_MAP.HEALTH] <= 0 && shootable_map[? SHOOTABLE_MAP.CAN_DAMAGE]) {
	//Bomb sound effect
	scPlaySound(SOUND.EFFECT_TARGET_BOMB);
	with (shooter)
		scDamageShootable(other, false, false, 1, false);
	//flash = 10;
	shootable_map[? SHOOTABLE_MAP.CAN_DAMAGE] = false;
	timer = 10 * TIME_SPEED;
	show_debug_message("BOMB HIT!");
}
