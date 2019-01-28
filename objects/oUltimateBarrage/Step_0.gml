/// @desc Move nuke
if (spawn_time > 0) exit;
if (direction > 270 || direction < 90)
	x += move_spd;
else if (direction < 270 && direction > 90)
	x -= move_spd;
if (direction == 270)
	y += move_spd;

if (y > RES_H + 50)
	event_user(0);
