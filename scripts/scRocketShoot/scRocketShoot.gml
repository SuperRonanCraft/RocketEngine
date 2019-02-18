/// @desc checks the cooldown, if so, start the next cooldown
// @arg force the cooldown

if ((rockets_enabled && current_reload <= 0 && current_cd == 0) || (argument_count > 0 ? argument[0] : false)) {
	x = other.x;
	y = other.y;
	current_cd = rocket_map[? ROCKET_MAP.COOLDOWN];
	current_delay = rocket_map[? ROCKET_MAP.STARTUP];
}