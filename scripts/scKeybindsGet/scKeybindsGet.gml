/// @arg key-type
/// @arg keyboard-only?*
var input = false;
var onlyboard = argument_count > 1 ? argument[1] : false;
var map = key_map;

//Keyboard
if (!controller_inuse)
	switch (argument[0]) {
		case KEYBIND_TYPE.LEFT:
			input = keyboard_check(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.LEFT]));
			break;
		case KEYBIND_TYPE.RIGHT:
			input = keyboard_check(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.RIGHT]));
			break;
		case KEYBIND_TYPE.JUMP:
			input = keyboard_check_pressed(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.JUMP]));
			break;
		case KEYBIND_TYPE.SHOOT:
			input = keyboard_check(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.SHOOT]));
			break;
		case KEYBIND_TYPE.ULT:
			input = keyboard_check_pressed(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.ULTIMATE]));
			break;
		case KEYBIND_TYPE.ABILITY:
			input = keyboard_check(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.ABILITY]));
			break;
	}

var keyboard = input;
if (input != false)
	controller_lastused = false;

//Gamepad
if (!onlyboard && !input && gamepad_is_connected(keys))
	switch (argument[0]) {
		case KEYBIND_TYPE.LEFT:
			if (gamepad_axis_value(keys, gp_axislh) < -0.2)
				input = abs(gamepad_axis_value(keys, gp_axislh));
			else
				input = gamepad_button_check(keys, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.LEFT]));
			break;
		case KEYBIND_TYPE.RIGHT:
			if (gamepad_axis_value(keys, gp_axislh) > 0.2)
				input = abs(gamepad_axis_value(keys, gp_axislh));
			else
				input = gamepad_button_check(keys, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.RIGHT]));
			break;
		case KEYBIND_TYPE.JUMP:
			input = gamepad_button_check_pressed(keys, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.JUMP_GP])); break;
		case KEYBIND_TYPE.SHOOT:
			input = gamepad_button_check(keys, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.SHOOT_GP])); break;
		case KEYBIND_TYPE.ULT:
			input = gamepad_button_check(keys, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.ULTIMATE_GP])); break;
		case KEYBIND_TYPE.ABILITY:
			input = gamepad_button_check(keys, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.ABILITY_GP])); break;
	}

if (input != keyboard) {
	controller_inuse = true;
	controller_lastused = true;
} else
	controller_inuse = false;

return input;

enum KEYBIND_TYPE {
	LEFT, RIGHT, JUMP, SHOOT, ULT, ABILITY
}