/// @desc Default ultimate
with (scSpawnRocket(x, y, depth + 1, team == TEAM.LEFT ? 0 : 180, id, rocket_map)) {
	rocket_map[? ROCKET_MAP.DAMAGE] *= 3;
	rocket_map[? ROCKET_MAP.SPEED] *= 1.5;
	rocket_map[? ROCKET_MAP.KBAMT] *= 1.5;
	//Explosion Size
	size = 3;
	//Scale
	image_xscale += .5;
	image_yscale += .5;
}