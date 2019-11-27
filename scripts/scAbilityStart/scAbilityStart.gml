///@arg ability

if (!system_ability) exit;
ability_map = ds_map_create();
var map = ability_map;

map[? ABILITY_MAP.ENABLED] = true;
map[? ABILITY_MAP.COOLDOWN] = 6; //in seconds
map[? ABILITY_MAP.CURRENT_TIME] = 0;
map[? ABILITY_MAP.TYPE] = argument0;
map[? ABILITY_MAP.CAST_TYPE] = ABILITY_CAST_TYPE.INSTANT;
map[? ABILITY_MAP.CAST_SCRIPT] = noone;
map[? ABILITY_MAP.CAST_OBJECT] = noone;
map[? ABILITY_MAP.SPRITE] = noone;
map[? ABILITY_MAP.NAME] = "Danger";
scAbilityLoad(map[? ABILITY_MAP.TYPE]);

enum ABILITY_MAP {
	ENABLED, COOLDOWN, CURRENT_TIME, TYPE, CAST_TYPE, CAST_SCRIPT, CAST_OBJECT,
	SPRITE, NAME
}

enum ABILITY_CAST_TYPE {
	INSTANT, MORPH, CHANNELING
}