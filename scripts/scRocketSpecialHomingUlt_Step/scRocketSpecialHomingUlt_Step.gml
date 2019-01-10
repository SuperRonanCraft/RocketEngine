var map = homing;
with (map[? "target"]) {
	var clock = map[? "clock"];
	if (clock > 35) {
		map[? "locX"] = x + irandom_range(-30,30);
		map[? "locY"] = y + irandom_range(-30,30);
	}
	var dir = point_direction(other.x, other.y, map[? "locX"], map[? "locY"]); //Direction to target
	var diff = angle_difference(dir, other.direction); //The difference between the rocket direction and target direction
	if (abs(diff) < 270) {
		if (clock > 25)
			other.direction += clamp(diff, -5, 5); //Slowly rotate the rocket
		other.image_angle = other.direction;
	}
	map[? "clock"] = clock + 1;
}
x += lengthdir_x(rocket_map[? ROCKET_MAP.SPEED], direction);
y += lengthdir_y(rocket_map[? ROCKET_MAP.SPEED], direction);

rocket_map[? ROCKET_MAP.SPEED] += 0.2;