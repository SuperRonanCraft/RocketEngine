/// @desc Default ultimate
with (scSpawnRocket(x, y, depth + 1, team == TEAM.LEFT ? 0 : 180, id, rocket_map, [ROCKET_MAP.SCALE], [2])) {
	rocket_map[? ROCKET_MAP.DAMAGE] *= 3;
	rocket_map[? ROCKET_MAP.SPEED] *= 1.5;
	rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = false;
	rocket_map[? ROCKET_MAP.KBAMT] *= 1.5;
	//Explosion Size
	size = 3;
	x += lengthdir_x(rocket_map[? ROCKET_MAP.OFFSET], direction);
}