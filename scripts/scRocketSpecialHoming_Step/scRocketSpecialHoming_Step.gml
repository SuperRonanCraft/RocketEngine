if (!instance_exists(target))
	target = scFindTarget(owner.team);
with (target) {
	var dir = point_direction(other.x, other.y, x, y); //Direction to target
	var diff = angle_difference(dir, other.direction); //The difference between the rocket direction and target direction
	if (abs(diff) < 45) {
		other.direction += clamp(diff, -2, 2); //Slowly rotate the rocket
		other.image_angle = other.direction;
	}
}

var spd = rocket_map[? ROCKET_MAP.SPEED];
scMovementLine(spd, direction);
//x += lengthdir_x(spd, direction);
//y += lengthdir_y(spd, direction);