/// @desc Move nuke
if (direction > 270 || direction < 90)
	x += move_spd;
else if (direction < 270 && direction > 90)
	x -= move_spd;
if (direction == 270)
	y += move_spd;
