/// @desc step event for abilities

if (!system_ability) exit;
var map = ability_map;

if (!map[? ABILITY_MAP.ENABLED] || !player_map[? PLAYER_MAP.CAN_CONTROL] || map[? ABILITY_MAP.TYPE] == ABILITY_TYPE.NONE) exit; //Is the system even enabled?

if (map[? ABILITY_MAP.CURRENT_TIME] > 0) { //Decrease cooldown, exit
	map[? ABILITY_MAP.CURRENT_TIME]--;
	exit;
}

var key_shoot = scKeybindsGet(KEYBIND_TYPE.ABILITY); //Holding both left and right keys to cast ult

if (player_aimode == 1 && aiBrain != noone)
	key_shoot = aiBrain.AIAbility;

if (!key_shoot) exit; //Not engaging ability, exit

show_debug_message("Ability!");

if (map[? ABILITY_MAP.CAST_SCRIPT] != noone) {
	var dir = team != TEAM.NONE ? (team == TEAM.LEFT ? 0 : 180) : (facing == 1 ? 0 : 180);
	if (auto_aim)
		dir = scAutoAim();
	script_execute(map[? ABILITY_MAP.CAST_SCRIPT], dir, map);
}

map[? ABILITY_MAP.CURRENT_TIME] = map[? ABILITY_MAP.COOLDOWN] * room_speed;