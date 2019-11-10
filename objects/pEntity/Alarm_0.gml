/// @desc Gamepad stop vibration alarm

if (gamepad_is_connected(keys))
	gamepad_set_vibration(keys, 0, 0);