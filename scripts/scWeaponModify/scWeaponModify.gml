///@desc change a players weapon, return true/false if weapon was changed
///@arg weapon-map
///@arg weapon-modifier
function scWeaponModify(argument0, argument1) {
	var _map = argument0
	var _mod = argument1;

	var type = _map[? WEAPON_MAP.TYPE];
	var weapon = scWeaponModifyGetWeapon(_mod, _map);
	if (weapon != noone) {
		switch (type) {
			case WEAPON_TYPE.ROCKET:
				scRocketChange(weapon, _map);
				break;
			case WEAPON_TYPE.SHURIKEN:
				scShurikenChange(weapon, _map);
				break;
			case WEAPON_TYPE.ARROW:
				scArrowChange(weapon, _map);
				break;
			case WEAPON_TYPE.POTION:
				scPotionChange(weapon, _map);
				break;
		}
		_map[? WEAPON_MAP.MODIFIER] = _mod;
	}

	return weapon == noone;


}
