function scRocketSpecialRandom_Step() {
	var dir = round(random_range(-5, 5));
	var val = direction + dir;
	//Facing right
	if (side) {
		if (val < 90 && val > -90)
			direction += dir;
	} else if (val > 90 && val < 270)
		direction += dir;

	image_angle = direction;

	var spd = weapon_map[? WEAPON_MAP.SPEED];
	scMovementLine(spd, direction);
	//x += lengthdir_x(rocket_map[? ROCKET_MAP.SPEED], direction);
	//y += lengthdir_y(rocket_map[? ROCKET_MAP.SPEED], direction);


}
