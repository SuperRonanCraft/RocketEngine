/// @desc keyboard-controls

//Keyboard
var key_left = keyboard_check(keyleft); 
var key_right = keyboard_check(keyright);
var key_jump = keyboard_check_pressed(keyjump);
var key_shoot = keyboard_check(keyshoot);

//Gamepad
if (!(key_left || key_right || key_jump || key_shoot) && gamepad_is_connected(controller)) {
	if (abs(gamepad_axis_value(controller, gp_axislh)) > 0.2){
		key_left = abs(min(gamepad_axis_value(controller, gp_axislh), 0));
		key_right = max(gamepad_axis_value(controller, gp_axislh), 0);
	}
	if (gamepad_button_check_pressed(controller, gp_face1))
		key_jump = 1;
	if (gamepad_button_check(controller, gp_shoulderr))
		key_shoot = 1;
}

//Check if can control
if (canControl){
	//Horizontal
	var move = (key_right - key_left) * keydirection;
	controlling = move;
	
	//Direction
	if (move != 0)
		facing = move;
	
	//Friction
	if (move == 0 && hsp_move != 0) {
		hsp_move = sign(hsp_move) * (abs(hsp_move) - abs( hsp_move * (friction_base+friction_adj) ) );	
		hsp_move += recoilKB;
		//Ease into 0
		if (abs(hsp_move) < 0.5) {
			hsp_move = 0;
		}
	}
	else{
		hsp_move = (move * walksp) + (move_adj * move) + recoilKB ;
	}

	//Vertical
	if (key_jump && standing) {
		vsp_move = (-jump_height - jump_adj) * grv_dir;
		standing = false;
	}
	//Weapon
	if (key_shoot)
		scRocketShoot();
} 

else{ 
	hsp_move = move_adj;
}

//Reset recoil

if (recoilKB < recoilMAX)
	recoilKB ++;
else if recoilKB > recoilMAX
	recoilKB --;
else
	recoilMAX = 0;



