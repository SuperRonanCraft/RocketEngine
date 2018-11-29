var dir = round(random_range(-5, 5));
var val = direction + dir;
//Facing right
if (side) {
	if (val < 90 && val > -90)
		direction += dir;
} else if (val > 90 && val < 270)
	direction += dir;

image_angle = direction;
x += lengthdir_x(rocket_map[? ROCKET_MAP.SPEED], direction);
y += lengthdir_y(rocket_map[? ROCKET_MAP.SPEED], direction);