if (!system_ability) exit;
ability_map = ds_map_create();
var map = ability_map;

map[? ABILITY_MAP.ENABLED] = true;
map[? ABILITY_MAP.COOLDOWN] = 6;
map[? ABILITY_MAP.CURRENT_TIME] = map[? ABILITY_MAP.COOLDOWN] * room_speed;
map[? ABILITY_MAP.CAST_TYPE] = ABILITY_CAST_TYPE.INSTANT;

enum ABILITY_MAP {
	ENABLED, COOLDOWN, CURRENT_TIME, TYPE, CAST_TYPE
}

enum ABILITY_CAST_TYPE {
	INSTANT, MORPH, CHANNELING
}