/// @desc next buffs page

//Gamepad change
if (gamepad_type < GAMEPAD_TYPE.OTHER) //NEXT
	gamepad_type++;
else
	gamepad_type = 0;