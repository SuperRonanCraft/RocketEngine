// @arg direction
var dir = argument0;
var keys = [ROCKET_MAP.ULTIMATE_CHARGE_GIVE, ROCKET_MAP.ROCKET_STEP, ROCKET_MAP.ROCKET_CREATE];
var values = [false, scUltimateHugesplosion_Step, scUltimateHugesplosion_Create];
var offset = rocket_map[? ROCKET_MAP.OFFSET];
with (scSpawnRocket(x + lengthdir_x(offset, dir), y + lengthdir_y(offset, dir), depth, dir, id, rocket_map, keys, values))
	size = 1.3;