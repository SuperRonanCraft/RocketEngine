///@desc player movement (NETWORK)
///@arg update-keys
///@arg keybind
///@arg value

var _update = argument[0];

//KEYBINDS
if (_update) {
	switch (argument[1]) {
		case KEYBIND.LEFT:
			key_left = argument[2]; break;
		case KEYBIND.RIGHT:
			key_right = argument[2]; break;
		case KEYBIND.JUMP:
			key_jump = argument[2]; break;
		case KEYBIND.JUMP_RELEASE:
			key_jump_released = argument[2]; break;
		case KEYBIND.SHOOT:
			key_shoot = argument[2]; break;
		case KEYBIND.SHOOT_RELEASE:
			key_shoot_released = argument[2]; break;
		case KEYBIND.ULT:
			key_ult = argument[2]; break;
		case KEYBIND.ABILITY:
			key_ability = argument[2]; break;
	}
} else
	scKeybindsMove();