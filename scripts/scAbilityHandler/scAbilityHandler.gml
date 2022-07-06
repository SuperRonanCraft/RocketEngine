/// @desc step event for abilities
function scAbilityHandler() {

	if (!system_ability) exit;
	var map = ability_map;

	if (local_player) {
		var _old_key_ability = key_ability;
		key_ability = scKeybindsGet(KEYBIND.ABILITY);
		if (_old_key_ability != key_ability)
			scNetworkSendKey(KEYBIND.ABILITY, key_ability);
	}

	if (!map[? ABILITY_MAP.ENABLED] || !player_map[? PLAYER_MAP.CAN_CONTROL] || map[? ABILITY_MAP.TYPE] == ABILITY_TYPE.NONE) exit; //Is the system even enabled?

	if (map[? ABILITY_MAP.CURRENT_TIME] > 0) { //Decrease cooldown, exit
		map[? ABILITY_MAP.CURRENT_TIME]-= time_dialation;
		exit;
	}

	if (player_aimode == 1 && aiBrain != noone)
		key_ability = aiBrain.AIAbility;

	if (!key_ability) exit; //Not engaging ability, exit

	//show_debug_message("Ability!");

	if (map[? ABILITY_MAP.CAST_SCRIPT] != noone) {
		var dir = team != TEAM.NONE ? (team == TEAM.LEFT ? 0 : 180) : (facing == 1 ? 0 : 180);
		if (auto_aim)
			dir = scAutoAim();
		script_execute(map[? ABILITY_MAP.CAST_SCRIPT], dir, map);
	}
	if (map[? ABILITY_MAP.CAST_OBJECT] != noone)
		with (instance_create_depth(x, y, depth + 1, map[? ABILITY_MAP.CAST_OBJECT]))
			owner = other;

	map[? ABILITY_MAP.CURRENT_TIME] = map[? ABILITY_MAP.COOLDOWN] * room_speed;

	key_ability = false;


}
