/// @desc Reverse ultimate

var inst = instance_create_depth(x, y, depth, oPlayer);
with (inst) {
	keyleft = other.keyright;
	keyright = other.keyleft;
	keyjump = other.keyjump;
	keyshoot = noone; //Cannot shoot
	team = other.team; //Same team as caster
	display = false; //No ui
	ult_enabled = false; //Disable ult
	hp = 1; //One hit kill
	hp_original = 1;
	despawn = true; //Despawn player if dead
}