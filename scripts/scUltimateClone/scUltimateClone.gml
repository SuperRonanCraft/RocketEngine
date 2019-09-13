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
	//player_map[? PLAYER_MAP.HEALTH] = 1; //One hit kill
	shootable_map[? SHOOTABLE_MAP.HEALTH] = 1; //One hit kill
	shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL] = 1;
	despawn = true; //Despawn player if dead
	walksp += random_range(-2, 2);
	owner = other; //Owner of this clone
	if (other.player_map[? "clones"] == undefined)
		other.player_map[? "clones"] = 0;
	other.player_map[? "clones"]++;
	player_map[? PLAYER_MAP.DESTROY_SCRIPT] = scUltimateClone_Destroy;
}

if (player_map[? "clones"] != undefined)
	scAchievements_CustomEvent(ACHIEVEMENTS.CLONES, player_map[? "clones"]);