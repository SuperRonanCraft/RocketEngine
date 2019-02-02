/// @arg key-type
var keyboard = false;

//Keyboard
switch (argument0) {
	case KEYBIND_TYPE.LEFT:
		keyboard = keyboard_check(keyleft);
		break;
	case KEYBIND_TYPE.RIGHT:
		keyboard = keyboard_check(keyright);
		break;
	case KEYBIND_TYPE.JUMP:
		keyboard = keyboard_check_pressed(keyjump);
		break;
	case KEYBIND_TYPE.SHOOT:
		keyboard = keyboard_check(keyshoot);
		break;
	case KEYBIND_TYPE.ULT:
		keyboard = keyboard_check(keyleft) && keyboard_check(keyright);
		break;
}

//Gamepad
if (!keyboard && gamepad_is_connected(controller)) {
	switch (argument0) {
		case KEYBIND_TYPE.LEFT:
			if (abs(gamepad_axis_value(controller, gp_axislh)) > 0.2)
				keyboard = abs(min(gamepad_axis_value(controller, gp_axislh), 0));
			break;
		case KEYBIND_TYPE.RIGHT:
			if (abs(gamepad_axis_value(controller, gp_axislh)) > 0.2)
				keyboard = max(gamepad_axis_value(controller, gp_axislh), 0);
			break;
		case KEYBIND_TYPE.JUMP:
			keyboard = gamepad_button_check_pressed(controller, gp_face1);
			break;
		case KEYBIND_TYPE.SHOOT:
			keyboard = gamepad_button_check(controller, gp_shoulderr);
			break;
		case KEYBIND_TYPE.ULT:
			keyboard = false; //WE NEED A GAMEPAD OPTION FOR ULTS
			break;
	}
}

return keyboard;

enum KEYBIND_TYPE {
	LEFT, RIGHT, JUMP, SHOOT, ULT
}