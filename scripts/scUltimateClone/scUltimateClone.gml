/// @desc Reverse ultimate

var inst = instance_create_depth(x, y, depth, oPlayer);
with (inst) {
	if (other.player_aimode)
		aiBrain = other.aiBrain;
	ult_enabled = false;
	rockets_enabled = false;
	keyleft = other.keyright;
	keyright = other.keyleft;
	keyshoot = noone; //Cannot shoot
	team = other.team; //Same team as caster
	display = false; //No ui
	ult_enabled = false; //Disable ult
	hp = 1; //One hit kill
	hp_original = 1;
	despawn = true; //Despawn player if dead
	walksp += random_range(-2, 2);
}