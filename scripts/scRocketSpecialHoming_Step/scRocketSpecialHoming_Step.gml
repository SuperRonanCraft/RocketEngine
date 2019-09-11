if (!instance_exists(target))
	target = scFindTarget(owner.team);
with (target) {
	var dir = point_direction(other.x, other.y, x, y); //Direction to target
	var diff = angle_difference(dir, other.direction); //The difference between the rocket direction and target direction
	if (abs(diff) < 45) {
		other.direction += clamp(diff, -2, 2) / TIME_SPEED; //Slowly rotate the rocket
		other.image_angle = other.direction;
	}
}

var spd = weapon_map[? WEAPON_MAP.SPEED];
scMovementLine(spd, direction);