///@desc change a players weapon, return true/false if weapon was changed
///@arg player
///@arg weapon-modifier
var player = argument0
var modifier = argument1;

with (player) {
	var type = weapon_map[? WEAPON_MAP.TYPE];
	var weapon = scWeaponModifyGetWeapon(modifier);
	if (weapon != noone) {
		switch (type) {
			case WEAPON.ROCKET:
				scRocketChange(weapon);
				break;
			case WEAPON.SHURIKEN:
				scShurikenChange(weapon);
				break;
		}
		weapon_map[? WEAPON_MAP.MODIFIER] = modifier;
	}
}

return weapon == noone;