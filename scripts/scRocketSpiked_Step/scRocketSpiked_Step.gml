
var spd = rocket_map[? ROCKET_MAP.SPEED];

if (direction < 90 && direction > -80)
	direction -= 1.5;
else if (direction > 90 && direction < 260)
	direction += 1.5;

image_angle = direction;
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
