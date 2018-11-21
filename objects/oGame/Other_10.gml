/// @desc Toggle Pause
if (room != rMenu)
	if (!global.pause)
		event_user(2);
	else
		event_user(1);