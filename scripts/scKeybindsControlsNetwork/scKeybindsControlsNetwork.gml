///@desc player movement (NETWORK)
///@arg update-keys
///@arg keybind
///@arg value

var _update = argument[0];

//KEYBINDS
if (_update) {
	switch (argument[1]) {
		case KEYBIND_TYPE.LEFT:
			key_left = argument[2]; break;
		case KEYBIND_TYPE.RIGHT:
			key_right = argument[2]; break;
		case KEYBIND_TYPE.JUMP:
			key_jump = argument[2]; break;
		case KEYBIND_TYPE.JUMP_RELEASE:
			key_jump_released = argument[2]; break;
		case KEYBIND_TYPE.SHOOT:
			key_shoot = argument[2]; break;
		case KEYBIND_TYPE.SHOOT_RELEASE:
			key_shoot_released = argument[2]; break;
	}
} else
	scKeybindsMove();