/// @desc player movement

if (!local_player) { //Recieving inputs
	if (global.network_connected)
		scKeybindsControlsNetwork(false);
	exit;
}

var _old_key_left = key_left; 
var _old_key_right = key_right;
var _old_key_jump = key_jump;
var _old_key_jump_released = key_jump_released;
var _old_key_shoot = key_shoot;
var _old_key_shoot_released = key_shoot_released;

//KEYBINDS
key_left = scKeybindsGet(KEYBIND.LEFT); 
key_right = scKeybindsGet(KEYBIND.RIGHT);
key_jump = scKeybindsGet(KEYBIND.JUMP);
key_jump_released = scKeybindsGet(KEYBIND.JUMP_RELEASE);
key_shoot = scKeybindsGet(KEYBIND.SHOOT);
key_shoot_released = scKeybindsGet(KEYBIND.SHOOT_RELEASE);

scKeybindsMove();

if (_old_key_left != key_left)
	scNetworkSendKey(KEYBIND.LEFT, key_left);
if (_old_key_right != key_right)
	scNetworkSendKey(KEYBIND.RIGHT, key_right);
if (_old_key_jump || _old_key_jump != key_jump)
	scNetworkSendKey(KEYBIND.JUMP, key_jump);
if (_old_key_jump_released != key_jump_released)
	scNetworkSendKey(KEYBIND.JUMP_RELEASE, key_jump_released);
if (_old_key_shoot != key_shoot)
	scNetworkSendKey(KEYBIND.SHOOT, key_shoot);
if (_old_key_shoot_released != key_shoot_released)
	scNetworkSendKey(KEYBIND.SHOOT_RELEASE, key_shoot_released);