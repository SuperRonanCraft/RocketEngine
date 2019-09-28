/// @desc Push player modifiers
with (oPlayer) {
	var hp = shootable_map[? SHOOTABLE_MAP.HEALTH];
	switch (global.mode_targets_difficulty) {
		case 0: hp = 10; break;
		case 1: hp = 6; break;
		case 2: hp = 2; break;
	}
	shootable_map[? SHOOTABLE_MAP.HEALTH] = hp;
	shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL] = hp;
	scWeaponModify(id, WEAPON_MODIFIER.FIRE);
}