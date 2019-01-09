/// @desc Burst ultimate
var dir = 0;
for (var i = 0; i < 5; i++) {
	//Set direction offset
	if (team == TEAM.LEFT)
		dir = 40 - (20 * i);
	else
		dir = 140 + (20 * i);
	//Create the rocket with the new direction
	with (scSpawnRocket(x, y, depth - 1, dir, id, rocket_map))
		rocket_map[? ROCKET_MAP.IGNORE_WALL] = true;
}