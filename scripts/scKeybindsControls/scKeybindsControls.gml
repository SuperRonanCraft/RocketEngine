/// @desc keyboard-controls
var key_left = keyboard_check(keyleft); 
var key_right = keyboard_check(keyright);
var key_jump = keyboard_check_pressed(keyjump);
var key_shoot = keyboard_check(keyshoot);

if (!(key_left || key_right || key_jump)) {
	if (abs(gamepad_axis_value(controller, gp_axislh)) > 0.2){
		key_left = abs(min(gamepad_axis_value(controller, gp_axislh), 0));
		key_right = max(gamepad_axis_value(controller, gp_axislh), 0);
	}
	if (gamepad_button_check_pressed(controller, gp_face1))
		key_jump = 1;
}

//Horizontal
var move = key_right - key_left;
hsp = move * walksp;

//Vertical
if (key_jump && standing) {
	vsp = -jump_height;
	standing = false;
}

//Weapon
if (key_shoot)
	scRocketShoot();