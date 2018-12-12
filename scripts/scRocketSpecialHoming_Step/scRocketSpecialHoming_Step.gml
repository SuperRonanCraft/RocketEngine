if (target != noone) {
	var dir = point_direction(x, y, target.x, target.y); //Direction to target
	var diff = angle_difference(dir, direction); //The difference between the rocket direction and target direction
	if (abs(diff) < 45) {
		direction += clamp(diff, -2, 2); //Slowly rotate the rocket
		image_angle = direction;
	}
}
x += lengthdir_x(rocket_map[? ROCKET_MAP.SPEED], direction);
y += lengthdir_y(rocket_map[? ROCKET_MAP.SPEED], direction);