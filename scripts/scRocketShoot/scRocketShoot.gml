/// @desc checks the cooldown, if so, start the next cooldown
if (current_cd == 0) {
	x = other.x;
	y = other.y;
	current_cd = rocket_map[? ROCKET_MAP.COOLDOWN];
	current_delay = rocket_map[? ROCKET_MAP.STARTUP];
}