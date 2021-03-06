if (!system_ultimate) exit;
ultimate_map = ds_map_create();
var map = ultimate_map;

map[? ULTIMATE_CASTING_MAP.ENABLED] = true;
map[? ULTIMATE_CASTING_MAP.CHARGE_MAX] = 2 * TIME_SPEED;
map[? ULTIMATE_CASTING_MAP.CHARGE] = map[? ULTIMATE_CASTING_MAP.CHARGE_MAX] / 2;
map[? ULTIMATE_CASTING_MAP.CHARGE_DIRECT] = 15 / 100;
map[? ULTIMATE_CASTING_MAP.CHARGE_SPLASH] = 7.5 / 100;
map[? ULTIMATE_CASTING_MAP.CHARGE_INDIRECT] = 5 / 100;
map[? ULTIMATE_CASTING_MAP.CHARGE_TIME] = 1 / 1000;
map[? ULTIMATE_CASTING_MAP.CHARGE_MULTI] = 1;
map[? ULTIMATE_CASTING_MAP.CHARGE_SHOW] = true;
map[? ULTIMATE_CASTING_MAP.READY] = false;
//Depricated
map[? ULTIMATE_CASTING_MAP.CAST_TIME] = 0;
map[? ULTIMATE_CASTING_MAP.CAST_TIME_ORIGINAL] = 0;
map[? ULTIMATE_CASTING_MAP.CASTING] = false;
map[? ULTIMATE_CASTING_MAP.CASTING_MAP] = ds_map_create();
map[? ULTIMATE_CASTING_MAP.CASTING_LAST] = noone;
map[? ULTIMATE_CASTING_MAP.CASTED_DRAW] = noone;

enum ULTIMATE_CASTING_MAP {
	ENABLED, 
	//CHARGE
	CHARGE, CHARGE_MAX, CHARGE_DIRECT, CHARGE_SPLASH, 
	CHARGE_INDIRECT, CHARGE_TIME, CHARGE_MULTI, READY,
	CHARGE_SHOW,
	//CASTING
	CAST_TIME, CAST_TIME_ORIGINAL, CASTING, CASTING_MAP, CASTING_LAST,
	CASTED_DRAW
}