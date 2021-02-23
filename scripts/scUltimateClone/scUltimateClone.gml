/// @desc Reverse ultimate
function scUltimateClone() {

	var inst = instance_create_depth(x, y, depth, oPlayer);
	with (inst) {
		var _cmap = other.player_map[? PLAYER_MAP.CHARACTER_INFO];
		scPlayerCharacterChange(_cmap[? CHARACTER_MAP.TYPE], false);
		if (other.player_aimode)
			aiBrain = other.aiBrain;
		ultimate_map[? ULTIMATE_CASTING_MAP.ENABLED] = false;
		weapon_map[? WEAPON_MAP.ENABLED] = false;
		ability_map[? ABILITY_MAP.ENABLED] = false;
		system_ability = false;
		system_combo = false;
		system_ultimate = false;
		keys = other.keys;
		scKeybindsSet(keys);
		var _keyLeft = key_map[? KEYBIND_MAP.LEFT];
		key_map[? KEYBIND_MAP.LEFT] = key_map[? KEYBIND_MAP.RIGHT];
		key_map[? KEYBIND_MAP.RIGHT] = _keyLeft;
		_keyLeft = key_map[? KEYBIND_MAP.LEFT_GP];
		key_map[? KEYBIND_MAP.LEFT_GP] = key_map[? KEYBIND_MAP.RIGHT_GP];
		key_map[? KEYBIND_MAP.RIGHT_GP] = _keyLeft;
		//keyshoot = noone; //Cannot shoot
		team = other.team; //Same team as caster
		display = false; //No ui
		//player_map[? PLAYER_MAP.HEALTH] = 1; //One hit kill
		shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = 1; //One hit kill
		shootable_map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] = 1;
		shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR] = 0; //One hit kill
		shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR_ORIGINAL] = 0;
		shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] = 0; //One hit kill
		shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL] = 0;
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


}
