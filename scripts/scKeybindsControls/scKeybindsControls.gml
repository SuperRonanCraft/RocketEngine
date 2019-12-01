/// @desc player movement

if (!local_player) {
	scKeybindsControlsNetwork(false);
	exit;
}

//KEYBINDS
key_left = scKeybindsGet(KEYBIND_TYPE.LEFT); 
key_right = scKeybindsGet(KEYBIND_TYPE.RIGHT);
key_jump = scKeybindsGet(KEYBIND_TYPE.JUMP);
key_jump_released = scKeybindsGet(KEYBIND_TYPE.JUMP_RELEASE);
key_shoot = scKeybindsGet(KEYBIND_TYPE.SHOOT);
key_shoot_released = scKeybindsGet(KEYBIND_TYPE.SHOOT_RELEASE);

scKeybindsMove();

//if (key_left)
	scNetworkSendKey(KEYBIND_TYPE.LEFT, key_left);
//if (key_right)
	scNetworkSendKey(KEYBIND_TYPE.RIGHT, key_right);
//if (key_jump)
	scNetworkSendKey(KEYBIND_TYPE.JUMP, key_jump);
//if (key_jump_released)
	scNetworkSendKey(KEYBIND_TYPE.JUMP_RELEASE, key_jump_released);
//if (key_shoot)
	scNetworkSendKey(KEYBIND_TYPE.SHOOT, key_shoot);
//if (key_shoot_released)
	scNetworkSendKey(KEYBIND_TYPE.SHOOT_RELEASE, key_shoot_released);