/// @desc player movement

//KEYBINDS
var key_left = scKeybindsGet(KEYBIND_TYPE.LEFT); 
var key_right = scKeybindsGet(KEYBIND_TYPE.RIGHT);
var key_jump = scKeybindsGet(KEYBIND_TYPE.JUMP);
var key_jump_released = scKeybindsGet(KEYBIND_TYPE.JUMP_RELEASE);
var key_shoot = scKeybindsGet(KEYBIND_TYPE.SHOOT);
var key_shoot_released = scKeybindsGet(KEYBIND_TYPE.SHOOT_RELEASE);

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
	if (	key_jump && //Key jump
			_map[? GRAVITY_MAP.JUMP_LAG] <= _map[? GRAVITY_MAP.JUMP_LAG_MAX] &&  //Edge lag
			_map[? GRAVITY_MAP.JUMP_DELAY] >= _map[? GRAVITY_MAP.JUMP_DELAY_MAX] && //Delay between jumps
			_map[? GRAVITY_MAP.JUMP_JUMPS] < _map[? GRAVITY_MAP.JUMP_JUMPS_MAX]) { //Maximum combo of jumps
		_map[? GRAVITY_MAP.VSP_MOVE] = (-(_map[? GRAVITY_MAP.JUMP_HEIGHT] + _map[? GRAVITY_MAP.JUMP_MOD])) * grv_dir;
		_map[? GRAVITY_MAP.STANDING] = false;
		_map[? GRAVITY_MAP.JUMP_LAG] = 0;
		_map[? GRAVITY_MAP.JUMP_DELAY] = 0;
		_map[? GRAVITY_MAP.JUMP_JUMPS]++;
		//scPlaySound(SOUND.EFFECT_PLAYER_JUMP);
	} else if (!_map[? GRAVITY_MAP.STANDING]) { //Jumping
		
		if (key_jump_released && _map[? GRAVITY_MAP.JUMP_JUMPS] == 1) {
			if (sign(_map[? GRAVITY_MAP.VSP]) == -sign(grv_dir)) {
				_map[? GRAVITY_MAP.VSP_MOVE] = lerp(_map[? GRAVITY_MAP.VSP_MOVE], 0, 0.3);
			}
		}
		
		if (	_map[? GRAVITY_MAP.JUMP_JUMPS] == 0 &&
				_map[? GRAVITY_MAP.JUMP_LAG] <= _map[? GRAVITY_MAP.JUMP_LAG_MAX]) //Delay between being able to walk off an edge and jump
			_map[? GRAVITY_MAP.JUMP_LAG]++;
		else if (_map[? GRAVITY_MAP.JUMP_JUMPS] == 0) {
			_map[? GRAVITY_MAP.JUMP_JUMPS]++;
			_map[? GRAVITY_MAP.JUMP_LAG] = 0;
		}
	} else { //Reset once on ground
		_map[? GRAVITY_MAP.JUMP_LAG] = 0;
		_map[? GRAVITY_MAP.JUMP_JUMPS] = 0;
	}
	if (_map[? GRAVITY_MAP.JUMP_DELAY] <= _map[? GRAVITY_MAP.JUMP_DELAY_MAX]) //Delay between jumps
		_map[? GRAVITY_MAP.JUMP_DELAY]++;
	
	//Weapon
	if (key_shoot)
		scWeaponActivate();
	if(key_shoot_released)
		scWeaponActivate();
}

//HORIZONTAL & Friction

if (_map[? GRAVITY_MAP.HSP_MOVE_MOD] == 0 && move != 0)
	_map[? GRAVITY_MAP.HSP_MOVE] = ((_map[? GRAVITY_MAP.WALK_SPEED] + _map[? GRAVITY_MAP.WALK_SPEED_MOD]) * move);
else if (_map[? GRAVITY_MAP.HSP_MOVE_MOD] != 0 && move != 0)
	_map[? GRAVITY_MAP.HSP_MOVE] = ((_map[? GRAVITY_MAP.WALK_SPEED] + _map[? GRAVITY_MAP.WALK_SPEED_MOD]) * move) + (_map[? GRAVITY_MAP.HSP_MOVE_MOD]);
else if (_map[? GRAVITY_MAP.HSP_MOVE_MOD] != 0)
	_map[? GRAVITY_MAP.HSP_MOVE] = _map[? GRAVITY_MAP.HSP_MOVE_MOD];
else
	_map[? GRAVITY_MAP.HSP_MOVE] *= _map[? GRAVITY_MAP.FRICTION];

if (abs(_map[? GRAVITY_MAP.HSP_MOVE]) < 1)
	_map[? GRAVITY_MAP.HSP_MOVE] = 0;

if(abs(_map[? GRAVITY_MAP.HSP_MOVE_MOD]) < 1)
	_map[? GRAVITY_MAP.HSP_MOVE_MOD] = 0;

_map[? GRAVITY_MAP.HSP_MOVE_MOD] *= _map[? GRAVITY_MAP.FRICTION]; //reset hsp mod