/// @desc Reverse ultimate

var inst = instance_create_depth(x, y, depth, oPlayer);
with (inst) {
	if (other.player_aimode)
		aiBrain = other.aiBrain;
	ultimate_map[? ULTIMATE_CASTING_MAP.ENABLED] = false;
	weapon_map[? WEAPON_MAP.ENABLED] = false;
	keyleft = other.keyright;
	keyright = other.keyleft;
	keyjump = other.keyjump;
	keyshoot = noone; //Cannot shoot
	team = other.team; //Same team as caster
	display = false; //No ui
	ult_enabled = false; //Disable ult
	player_map[? PLAYER_MAP.HEALTH] = 1; //One hit kill
	player_map[? PLAYER_MAP.HEALTH_ORIGINAL] = 1;
	despawn = true; //Despawn player if dead
	walksp += random_range(-2, 2);
}