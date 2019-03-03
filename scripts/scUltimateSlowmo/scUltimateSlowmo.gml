/// @desc Slowmo ultimate
/// @arg direction
var keys = [ROCKET_MAP.ROCKET_ALPHA, ROCKET_MAP.DAMAGE, ROCKET_MAP.ULTIMATE_CHARGE_GIVE,
	ROCKET_MAP.BUFF, ROCKET_MAP.KBAMT, ROCKET_MAP.ROCKET_STEP, ROCKET_MAP.ROCKET_CREATE];
var values = [0.5, 1, false, BUFFTYPE.SLOWMO, rocket_map[? ROCKET_MAP.KBAMT] * 1.5,
	scRocketSlime_Step, scRocketSlime_Create];
with (scSpawnRocket(x, y, depth + 1, argument0, id, rocket_map, keys, values)) {
	//Explosion Size
	size = 3;
	x += lengthdir_x(rocket_map[? ROCKET_MAP.OFFSET], direction);
}