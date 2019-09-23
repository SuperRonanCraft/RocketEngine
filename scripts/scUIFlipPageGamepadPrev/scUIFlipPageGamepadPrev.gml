/// @desc previous gamepad

//Gamepad change
if (gamepad_type != 0) //PREV
	gamepad_type--;
else
	gamepad_type = GAMEPAD_TYPE.OTHER;