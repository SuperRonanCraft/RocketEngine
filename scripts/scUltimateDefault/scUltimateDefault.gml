/// @desc Default ultimate
/// @arg null
/// @arg direction
var r_map = weapon_map[? WEAPON_MAP.MAP];
with (scSpawnRocket(x, y, depth + 1, argument0, id, r_map, [ROCKET_MAP.SCALE], [2])) {
	rocket_map[? ROCKET_MAP.DAMAGE] *= 3;
	rocket_map[? ROCKET_MAP.SPEED] *= 1.5;
	rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = false;
	rocket_map[? ROCKET_MAP.KBAMT] *= 1.5;
	//Explosion Size
	size = 3;
	x += lengthdir_x(rocket_map[? ROCKET_MAP.OFFSET], direction);
}