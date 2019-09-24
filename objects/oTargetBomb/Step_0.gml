/// @desc shot?

// Inherit the parent event
event_inherited();
if (shootable_map[? SHOOTABLE_MAP.HEALTH] <= 0 && shootable_map[? SHOOTABLE_MAP.CAN_DAMAGE]) {
	//Bomb sound effect
	scPlaySound(SOUND.EFFECT_TARGET_BOMB);
	scShootableDamage(self, shootable_map[? SHOOTABLE_MAP.SHOOTER], false, false, 1, true);
	//flash = 10;
	shootable_map[? SHOOTABLE_MAP.CAN_DAMAGE] = false;
	timer = 10 * TIME_SPEED;
	show_debug_message("BOMB HIT!");
	var p = shootable_map[? SHOOTABLE_MAP.SHOOTER];
	show_debug_message(p.shootable_map[? SHOOTABLE_MAP.HEALTH]);
	show_debug_message(p.shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL]);
}
