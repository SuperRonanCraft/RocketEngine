
var spd = rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation;
var side = direction > 90 && direction < 270 ? -1 : 1;
var dir = obsolete[? "dir"]; 
var val = 1.5 * owner.time_dialation;
if (dir < 90 && dir > -80)
	dir -= val;
else if (dir > 90 && dir < 260)
	dir += val;

obsolete[? "rot"] += 20 * obsolete[? "flip"];
image_angle = obsolete[? "rot"];
if (abs(image_angle / 360) > 1)
	image_angle -= sign(image_angle) * 360;
scMovementLine(spd, dir);
obsolete[? "dir"] = dir;