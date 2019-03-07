/// @desc Set the key binds to a specific player
/// @arg index-of-player
if (argument0 == KEYBIND.PLAYER1) {
	keyleft = global.key_p1_left;
	keyright = global.key_p1_right;
	keyjump = global.key_p1_jump;
	keyshoot = global.key_p1_shoot;
} else if (argument0 == KEYBIND.PLAYER2) {
	keyleft = global.key_p2_left;
	keyright = global.key_p2_right;
	keyjump = global.key_p2_jump;
	keyshoot = global.key_p2_shoot;
	keydirection = 1;
}
controller = argument0;
keydirection = 1;
controller_inuse = false;
controller_lastused = false;