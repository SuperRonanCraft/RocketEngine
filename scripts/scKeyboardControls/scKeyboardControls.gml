var key_left = keyboard_check(global.key_left);
var key_right = keyboard_check(global.key_right);
var key_jump = keyboard_check_pressed(global.key_jump);

//Horizontal
var move = key_right - key_left;
hsp = move * walksp;

//Vertical
if (key_jump && standing) {
	vsp = -jump_height;
	standing = false;
}