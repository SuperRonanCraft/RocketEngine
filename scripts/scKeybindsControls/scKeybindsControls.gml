/// @desc player movement

//KEYBINDS
var key_left = scKeybindsGet(KEYBIND_TYPE.LEFT); 
var key_right = scKeybindsGet(KEYBIND_TYPE.RIGHT);
var key_jump = scKeybindsGet(KEYBIND_TYPE.JUMP);
var key_shoot = scKeybindsGet(KEYBIND_TYPE.SHOOT);

//AI KEYBINDS
if (player_aimode && aiBrain != noone) {
	key_left = aiBrain.AILeft;
	key_right = aiBrain.AIRight;
	key_jump = aiBrain.AIJump;
	key_shoot = aiBrain.AIShoot;
}

//Horizontal
var move = (key_right - key_left) * keydirection;


//If cant control, neutralize move
if (!player_map[? PLAYER_MAP.ALIVE] || !player_map[? PLAYER_MAP.CAN_CONTROL])
	move = 0;
	
	
controlling = move;
var _map = gravity_map;
//Check if can control
if (player_map[? PLAYER_MAP.CAN_CONTROL]) {
	
	//Direction
	if (move != 0)
		facing = sign(move);
	
	//Friction

	//Vertical
	if (key_jump && _map[? GRAVITY_MAP.STANDING]) {
		_map[? GRAVITY_MAP.VSP_MOVE] = (-(_map[? GRAVITY_MAP.JUMP_HEIGHT] + _map[? GRAVITY_MAP.JUMP_MOD])) * grv_dir;
		_map[? GRAVITY_MAP.STANDING] = false;
		//scPlaySound(SOUND.EFFECT_PLAYER_JUMP);
	}
	//Weapon
	if (key_shoot)
		scWeaponActivate();
} else {
	//hsp_move = hsp;
}

//Friction
if (move == 0 && _map[? GRAVITY_MAP.HSP_MOVE] != 0 && _map[? GRAVITY_MAP.HSP_KNOCKBACK] == 0) {
	_map[? GRAVITY_MAP.HSP_MOVE] = sign(_map[? GRAVITY_MAP.HSP_MOVE]) * (abs(_map[? GRAVITY_MAP.HSP_MOVE]) - abs(_map[? GRAVITY_MAP.HSP_MOVE] * (friction_base + friction_adj)));	
	_map[? GRAVITY_MAP.HSP_MOVE] += _map[? GRAVITY_MAP.RECOIL];
	//Ease into 0
	if (abs(_map[? GRAVITY_MAP.HSP_MOVE]) < 0.1)
		_map[? GRAVITY_MAP.HSP_MOVE] = 0;
} 
//Move hsp
else if(_map[? GRAVITY_MAP.HSP_KNOCKBACK] == 0 && player_map[? PLAYER_MAP.CAN_CONTROL]) {
	_map[? GRAVITY_MAP.HSP_MOVE] = (move * _map[? GRAVITY_MAP.WALK_SPEED]) + (move * _map[? GRAVITY_MAP.HSP_MOVE_MOD]) + _map[? GRAVITY_MAP.RECOIL];
}

// /$$$$$$$$ /$$                 /$$$$$$$                                          /$$ /$$
//| $$_____/|__/                | $$__  $$                                        |__/| $$
//| $$       /$$ /$$   /$$      | $$  \ $$  /$$$$$$   /$$$$$$$  /$$$$$$  /$$   /$$ /$$| $$
//| $$$$$   | $$|  $$ /$$/      | $$$$$$$/ /$$__  $$ /$$_____/ /$$__  $$| $$  | $$| $$| $$
//| $$__/   | $$ \  $$$$/       | $$__  $$| $$$$$$$$| $$      | $$  \ $$| $$  | $$| $$| $$
//| $$      | $$  >$$  $$       | $$  \ $$| $$_____/| $$      | $$  | $$| $$  | $$| $$| $$
//| $$      | $$ /$$/\  $$      | $$  | $$|  $$$$$$$|  $$$$$$$|  $$$$$$/|  $$$$$$/| $$| $$
//|__/      |__/|__/  \__/      |__/  |__/ \_______/ \_______/ \______/  \______/ |__/|__/

//Reset recoil
if (_map[? GRAVITY_MAP.RECOIL] != 0)
	_map[? GRAVITY_MAP.RECOIL] = 0;
_map[? GRAVITY_MAP.HSP_MOVE_MOD] = 0; //reset hsp mod