/// @desc player movement

//Check if can control
if (canControl) {
	
	//KEYBINDS
	
	//(NORMAL)
	/*
	var key_left = scKeybindsGet(KEYBIND_TYPE.LEFT); 
	var key_right = scKeybindsGet(KEYBIND_TYPE.RIGHT);
	var key_jump = scKeybindsGet(KEYBIND_TYPE.JUMP);
	var key_shoot = scKeybindsGet(KEYBIND_TYPE.SHOOT);
	*/
	
	//NETWORK
	var key_left = keyboard_check(vk_left);
	var key_right = keyboard_check(vk_right);
	var key_jump = keyboard_check(vk_up);
	var key_shoot = keyboard_check(vk_down);
	
	
	//AI KEYBINDS
	if (player_aimode && aiBrain != noone) {
		key_left = aiBrain.AILeft;
		key_right = aiBrain.AIRight;
		key_jump = aiBrain.AIJump;
		key_shoot = aiBrain.AIShoot;
	}

	//Horizontal
	var move = (key_right - key_left) * keydirection;
	controlling = move;
	
	//Direction
	if (move != 0)
		facing = move;
	
	//Friction
	if (move == 0 && hsp_move != 0) {
		hsp_move = sign(hsp_move) * (abs(hsp_move) - abs(hsp_move * (friction_base + friction_adj)));	
		hsp_move += recoilKB;
		//Ease into 0
		if (abs(hsp_move) < 0.5)
			hsp_move = 0;
	} else
		hsp_move = (move * walksp) + (move_adj * move) + recoilKB;

	//Vertical
	if (key_jump && standing) {
		vsp_move = (-jump_height - jump_adj) * grv_dir;
		standing = false;
	}
	//Weapon
	if (key_shoot)
		scRocketShoot();
} else 
	hsp_move = move_adj;

//Reset recoil
if (recoilKB < recoilMAX)
	recoilKB++;
else if (recoilKB > recoilMAX)
	recoilKB--;
else
	recoilMAX = 0;