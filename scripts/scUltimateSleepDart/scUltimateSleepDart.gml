/// @desc Sleep ultimate
/// @arg direction
with (scSpawnRocket(x, y, depth + 1, argument0, id, rocket_map, [ROCKET_MAP.ROCKET_ALPHA, ROCKET_MAP.SPEED, ROCKET_MAP.ROCKET_CREATE], [0.5, 15, scRocketSpecialHoming_Create])) {
	rocket_map[? ROCKET_MAP.DAMAGE] = 1;
	rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = false;
	rocket_map[? ROCKET_MAP.KBAMT] *= 1.5;
	rocket_map[? ROCKET_MAP.BUFF] = BUFFTYPE.SLEEP;
	rocket_map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialHoming_Step;
	//Explosion Size
	size = 3;
	x += lengthdir_x(rocket_map[? ROCKET_MAP.OFFSET], direction);
}