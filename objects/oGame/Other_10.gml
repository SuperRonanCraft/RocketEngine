/// @desc Toggle Pause

//We are in a error screen
if (global.gamepad_error) exit;

if (!global.pause)
	event_user(2);
else
	event_user(1);