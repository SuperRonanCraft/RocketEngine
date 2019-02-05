
var spd = rocket_map[? ROCKET_MAP.SPEED];

if (direction < 90 && direction > -80)
	direction -= 0.3;
else if (direction > 90 && direction < 260)
	direction += 0.3;

image_angle = direction;
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
