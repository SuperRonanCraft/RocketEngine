/// @desc Default ultimate
/// @arg null
/// @arg direction
repeat (10)
	with (scSpawnRocket(x, y, depth + 1, argument0, id, rocket_map)) {
		rocket_map[? ROCKET_MAP.SPEED] *= 1.5;
		rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = false;
		rocket_map[? ROCKET_MAP.KBAMT] *= 1.5;
		x += lengthdir_x(rocket_map[? ROCKET_MAP.OFFSET], direction);
	}