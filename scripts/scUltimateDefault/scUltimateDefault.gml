/// @desc Default ultimate
/// @arg direction
var r_map = weapon_map;
with (scSpawnRocket(x, y, depth + 1, argument0, id, r_map, [ROCKET_MAP.SCALE], [2])) {
	weapon_map[? WEAPON_MAP.DAMAGE] *= 3;
	weapon_map[? WEAPON_MAP.SPEED] *= 1.5;
	var rocket_map = weapon_map[? WEAPON_MAP.MAP];
	rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = false;
	rocket_map[? ROCKET_MAP.KBAMT] *= 1.5;
	//Explosion Size
	rocket_map[? ROCKET_MAP.EXPLOSION_SCALE] *= 3;
	x += lengthdir_x(rocket_map[? ROCKET_MAP.OFFSET], direction);
}