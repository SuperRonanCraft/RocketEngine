/// @arg key-type
/// @arg keyboard-only?*
var keyboard = false;
var onlyboard = argument_count > 1 ? argument[1] : false;
var map = key_map;

//Keyboard
if (!controller_inuse)
	switch (argument[0]) {
		case KEYBIND_TYPE.LEFT:
			keyboard = keyboard_check(map[? KEYBIND_MAP.LEFT]);
			break;
		case KEYBIND_TYPE.RIGHT:
			keyboard = keyboard_check(map[? KEYBIND_MAP.RIGHT]);
			break;
		case KEYBIND_TYPE.JUMP:
			keyboard = keyboard_check_pressed(map[? KEYBIND_MAP.JUMP]);
			break;
		case KEYBIND_TYPE.SHOOT:
			keyboard = keyboard_check(map[? KEYBIND_MAP.SHOOT]);
			break;
		case KEYBIND_TYPE.ULT:
			keyboard = keyboard_check(map[? KEYBIND_MAP.ULTIMATE]);
			break;
		case KEYBIND_TYPE.ABILITY:
			keyboard = keyboard_check(map[? KEYBIND_MAP.ABILITY]);
			break;
	}

var keyboard_keys = keyboard;
if (keyboard != false)
	controller_lastused = false;

//Gamepad
if (!onlyboard && !keyboard && gamepad_is_connected(controller))
	switch (argument[0]) {
		case KEYBIND_TYPE.LEFT:
			if (gamepad_axis_value(controller, gp_axislh) < -0.2)
				keyboard = abs(gamepad_axis_value(controller, gp_axislh));
			break;
		case KEYBIND_TYPE.RIGHT:
			if (gamepad_axis_value(controller, gp_axislh) > 0.2)
				keyboard = abs(gamepad_axis_value(controller, gp_axislh));
			break;
		case KEYBIND_TYPE.JUMP:
			keyboard = gamepad_button_check_pressed(controller, gp_face1); break;
		case KEYBIND_TYPE.SHOOT:
			keyboard = gamepad_button_check(controller, gp_shoulderr); break;
		case KEYBIND_TYPE.ULT:
			keyboard = gamepad_button_check(controller, gp_face4); break;
		case KEYBIND_TYPE.ABILITY:
			keyboard = gamepad_button_check(controller, gp_face2); break;
	}

if (keyboard != keyboard_keys) {
	controller_inuse = true;
	controller_lastused = true;
} else
	controller_inuse = false;

return keyboard;

enum KEYBIND_TYPE {
	LEFT, RIGHT, JUMP, SHOOT, ULT, ABILITY
}