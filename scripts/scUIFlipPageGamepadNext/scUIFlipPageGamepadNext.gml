/// @desc next buffs page
function scUIFlipPageGamepadNext() {

	//Gamepad change
	if (gamepad_type < GAMEPAD_TYPE.OTHER) //NEXT
		gamepad_type++;
	else
		gamepad_type = 0;


}
