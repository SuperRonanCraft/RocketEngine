
var spd = rocket_map[? ROCKET_MAP.SPEED];
var dir = obsolete[? "dir"]; 
if (dir < 90 && dir > -80)
	dir -= 1.5;
else if (dir > 90 && dir < 260)
	dir += 1.5;

direction += 20 * obsolete[? "flip"]
image_angle = direction;
if (abs(image_angle / 360) > 1)
	image_angle -= sign(image_angle) * 360;
x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
obsolete[? "dir"] = dir; 