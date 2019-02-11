/// @desc Burst ultimate
var dir = 0;
for (var i = 0; i < 6; i++) {
	//Set direction offset
	if (argument0 == 0)
		dir = 37.5 - (15 * i);
	else
		dir = 142.5 + (15 * i);
	//Create the rocket with the new direction
	with (scSpawnRocket(x, y, depth - 1, dir, id, rocket_map, [ROCKET_MAP.ULTIMATE_CHARGE_GIVE, ROCKET_MAP.ROCKET_STEP], [false, noone])) {
		x += lengthdir_x(20, direction);
		y += lengthdir_y(20, direction);
		rocket_map[? ROCKET_MAP.IGNORE_WALL] = true;
	}
}