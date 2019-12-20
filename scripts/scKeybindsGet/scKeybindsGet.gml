/// @arg key-type
/// @arg keyboard-only?*

if (global.pause) exit;
var input = false;
var onlyboard = argument_count > 1 ? argument[1] : false;
var map = key_map;

//Keyboard
if (keys <= KEYBIND_PLAYER.PLAYER2 && !controller_inuse)
	switch (argument[0]) {
		case KEYBIND.LEFT:
			input = keyboard_check(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.LEFT]));
			break;
		case KEYBIND.RIGHT:
			input = keyboard_check(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.RIGHT]));
			break;
		case KEYBIND.JUMP:
			input = keyboard_check_pressed(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.JUMP]));
			break;
		case KEYBIND.JUMP_RELEASE:
			input = keyboard_check_released(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.JUMP]));
			break;
		case KEYBIND.SHOOT:
			input = keyboard_check(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.SHOOT]));
			break;
		case KEYBIND.SHOOT_RELEASE:
			input = keyboard_check_released(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.SHOOT]));
			break;
		case KEYBIND.ULT:
			input = keyboard_check_pressed(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.ULTIMATE]));
			break;
		case KEYBIND.ABILITY:
			input = keyboard_check(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.ABILITY]));
			break;
		case KEYBIND.INVENTORY:
			input = keyboard_check_pressed(scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.INVENTORY]));
			break;
	}

var keyboard = input;
if (input != false)
	controller_lastused = false;

//Gamepad
if (!onlyboard && !input && map[? KEYBIND_MAP.GAMEPAD] != noone) {
	var gamepad = scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.GAMEPAD])
	if (gamepad_is_connected(gamepad))
		switch (argument[0]) {
			case KEYBIND.LEFT:
				if (gamepad_axis_value(gamepad, gp_axislh) < -0.2)
					input = abs(gamepad_axis_value(gamepad, gp_axislh));
				else
					input = gamepad_button_check(gamepad, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.LEFT_GP]));
				break;
			case KEYBIND.RIGHT:
				if (gamepad_axis_value(gamepad, gp_axislh) > 0.2)
					input = abs(gamepad_axis_value(gamepad, gp_axislh));
				else
					input = gamepad_button_check(gamepad, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.RIGHT_GP]));
				break;
			case KEYBIND.JUMP:
				input = gamepad_button_check_pressed(gamepad, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.JUMP_GP])); break;
			case KEYBIND.JUMP_RELEASE:
				input = gamepad_button_check_released(gamepad, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.JUMP_GP])); break;
			case KEYBIND.SHOOT:
				input = gamepad_button_check(gamepad, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.SHOOT_GP])); break;
			case KEYBIND.SHOOT_RELEASE:
				input = gamepad_button_check_released(gamepad, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.SHOOT_GP])); break;
			case KEYBIND.ULT:
				input = gamepad_button_check_pressed(gamepad, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.ULTIMATE_GP])); break;
			case KEYBIND.ABILITY:
				input = gamepad_button_check_pressed(gamepad, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.ABILITY_GP])); break;
			case KEYBIND.INVENTORY:
				input = gamepad_button_check_pressed(gamepad, scSettingsGetType(SETTINGS_TYPE.VALUE, map[? KEYBIND_MAP.INVENTORY_GP])); break;
		}
}

if (input != keyboard) {
	controller_inuse = true;
	controller_lastused = true;
} else
	controller_inuse = false;

return input;

enum KEYBIND_TYPE {
	KEYBOARD, MOUSE
}

enum KEYBIND {
	LEFT, RIGHT, JUMP, JUMP_RELEASE, SHOOT, 
	SHOOT_RELEASE, ULT, ABILITY, INVENTORY
}