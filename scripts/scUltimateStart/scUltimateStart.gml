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

map[? ULTIMATE_CASTING_MAP.CAST_TIME] = 0;
map[? ULTIMATE_CASTING_MAP.CAST_TIME_MAX] = 0;
map[? ULTIMATE_CASTING_MAP.CASTING] = false;
map[? ULTIMATE_CASTING_MAP.CASTING_MAP] = ds_map_create();
map[? ULTIMATE_CASTING_MAP.CASTING_LAST] = noone;
map[? ULTIMATE_CASTING_MAP.CASTED_DRAW] = noone;

/*ult_charge_max = 2 * TIME_SPEED; //Absolute maximum charge 
ult_charge = ult_charge_max / 2; //Current ult charge
ult_enabled = true;
ult_charge_direct = 15 / 100; //Given in an direct damage event
ult_charge_splash = 7.5 / 100; //Given in an splash damage event
ult_charge_indirect = 5 / 100; //Given in an indirect damage event
ult_charge_time = 1 / 1000; //Given every step event
ult_charge_multiplier = 1; //Overall multiplier for ult charge*/

/*//key_old_shoot = false;
ult_cast_time = 0;
ult_cast_time_max = 0;
ult_casting = false;
ult_casting_map = ds_map_create();
ult_casting_last = noone; //The ultimate we were charging
//ult_casting_step = noone; //Ultimate casting step
//ult_casting_draw = noone; //Ultimate casting draw
ult_casted_draw = noone; //Ultimate casted draw*/

enum ULTIMATE_CASTING_MAP {
	ENABLED, 
	//CHARGE
	CHARGE, CHARGE_MAX, CHARGE_DIRECT, CHARGE_SPLASH, 
	CHARGE_INDIRECT, CHARGE_TIME, CHARGE_MULTI,
	//CASTING
	CAST_TIME, CAST_TIME_MAX, CASTING, CASTING_MAP, CASTING_LAST,
	CASTED_DRAW
}