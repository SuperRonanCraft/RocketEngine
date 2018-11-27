//true = left, false = right
var side = true;
if (x < 50 && direction == 180)
	teleporting = true;
else if (x > RES_W - 50 && direction == 0) {
	teleporting = true;
	side = false;
}
//Animate 
if (!teleported) {
	if (teleporting) {
		if (image_xscale != 0)
			image_xscale = max(image_xscale - 0.05, 0);
		else {
			if (side)
				x = RES_W - 50;
			else
				x = 50;
			teleported = true;
		}
	} else {
		x += lengthdir_x(rocket_map[? ROCKET_MAP.SPEED], direction);
		y += lengthdir_y(rocket_map[? ROCKET_MAP.SPEED], direction);
	}
} else {
	if (image_xscale != 1)
		image_xscale = min(image_xscale + 0.05, 1);
	else {
		teleported = false;
		teleporting = false;
	}
}
