/// @desc Slowmo ultimate
/// @arg direction
with (scSpawnRocket(x, y, depth + 1, argument0, id, rocket_map, [ROCKET_MAP.ROCKET_ALPHA], [0.5])) {
	rocket_map[? ROCKET_MAP.DAMAGE] = 1;
	rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = false;
	rocket_map[? ROCKET_MAP.KBAMT] *= 1.5;
	rocket_map[? ROCKET_MAP.BUFF] = BUFFTYPE.SLOWMO;
	//Explosion Size
	size = 3;
	x += lengthdir_x(rocket_map[? ROCKET_MAP.OFFSET], direction);
}