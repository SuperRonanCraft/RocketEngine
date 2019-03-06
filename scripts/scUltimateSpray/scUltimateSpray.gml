/// @desc Burst ultimate
/// @arg direction
/// @arg map
var dir = 0;
var amt = argument1[? "amt"];
var offset = ((90 / amt) / 2);
for (var i = 0; i < amt; i++) {
	//Set direction offset
	if (argument0 == 0)
		dir = (45 - offset) - ((90 / amt) * i);
	else
		dir = (135 + offset) + ((90 / amt) * i);
	//Create the rocket with the new direction
	with (scSpawnRocket(x, y, depth - 1, dir, id, rocket_map, [ROCKET_MAP.ULTIMATE_CHARGE_GIVE, ROCKET_MAP.ROCKET_STEP], [false, noone])) {
		x += lengthdir_x(35, direction);
		y += lengthdir_y(35, direction);
		rocket_map[? ROCKET_MAP.IGNORE_WALL] = true;
	}
}