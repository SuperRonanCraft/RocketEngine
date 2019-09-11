var map = homing;
if (!instance_exists(map[? "target"]))
	map[? "target"] = scFindTarget(owner.team);
with (map[? "target"]) {
	var clock = map[? "clock"];
	if (clock > room_speed) {
		map[? "locX"] = x + irandom_range(-30,30);
		map[? "locY"] = y + irandom_range(-30,30);
	}
	var dir = point_direction(other.x, other.y, map[? "locX"], map[? "locY"]); //Direction to target
	var diff = angle_difference(dir, other.direction); //The difference between the rocket direction and target direction
	if (abs(diff) < 270) {
		if (clock > 25)
			other.direction += clamp(diff, -5, 5) / TIME_SPEED; //Slowly rotate the rocket
		other.image_angle = other.direction;
	}
	map[? "clock"] = clock + 1;
}
scMovementLine(weapon_map[? WEAPON_MAP.SPEED], direction);

weapon_map[? WEAPON_MAP.SPEED] += 0.2 / TIME_SPEED;