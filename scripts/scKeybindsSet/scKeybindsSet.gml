/// @desc Set the key binds to a specific player
/// @arg index-of-player
if (argument0 == 1) {//Player 1
	keyleft = global.key_p1_left;
	keyright = global.key_p1_right;
	keyjump = global.key_p1_jump;
	keyshoot = global.key_p1_shoot;
} else if (argument0 == 2) {
	keyleft = global.key_p2_left;
	keyright = global.key_p2_right;
	keyjump = global.key_p2_jump;
	keyshoot = global.key_p2_shoot;
}
controller = argument0 - 1;