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
if(!playerMap[? PLAYER_MAP.ALIVE] || !playerMap[? PLAYER_MAP.CAN_CONTROL])
	move = 0;
	
	
controlling = move;

//Check if can control
if (playerMap[? PLAYER_MAP.CAN_CONTROL]) {
	
	//Direction
	if (move != 0)
		facing = sign(move);
	
	//Friction

	//Vertical
	if (key_jump && standing) {
		vsp_move = (-jump_height - jump_adj) * grv_dir;
		standing = false;
	}
	//Weapon
	if (key_shoot)
		scRocketShoot();
} else {
	hsp_move = hsp;
}

//Friction
if (move == 0 && hsp_move != 0 && hsp_knockback == 0) {
	hsp_move = sign(hsp_move) * (abs(hsp_move) - abs(hsp_move * (friction_base + friction_adj)));	
	hsp_move += recoilKB;
	//Ease into 0
	if (abs(hsp_move) < 0.5)
		hsp_move = 0;
} 
//Move hsp
else if(hsp_knockback == 0 && playerMap[? PLAYER_MAP.CAN_CONTROL])
	hsp_move = (move * walksp) + (move_adj * move) + recoilKB;


//Reset recoil
if (recoilKB < recoilMAX)
	recoilKB++;
else if (recoilKB > recoilMAX)
	recoilKB--;
else
	recoilMAX = 0;