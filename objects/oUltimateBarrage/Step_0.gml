/// @desc Move nuke
if (spawn_time > 0) exit;
scMovementLine(move_spd, direction);

if (y > RES_H + 50)
	event_user(0); //Explode this rocket
