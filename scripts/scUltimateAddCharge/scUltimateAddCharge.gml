/// @desc add charge related to the damage type of a hit
/// @arg charging-instance
/// @arg damage-type
/// @arg multiplier* direct multiplier for each instance

var inst = argument[0];
var type = argument_count > 1 ? (argument[1] != noone ? argument[1] : DAMAGETYPE.DIRECT) : DAMAGETYPE.DIRECT; //Damage type
var multi = argument_count > 2 ? argument[2] : 1; //Multiplier
var charge = 0;
var map = inst.ultimate_map;

with (inst) {
	switch (type) {
		case DAMAGETYPE.DIRECT: charge += map[? ULTIMATE_CASTING_MAP.CHARGE_DIRECT]; break;
		case DAMAGETYPE.SPLASH: charge += map[? ULTIMATE_CASTING_MAP.CHARGE_SPLASH]; break;
		case DAMAGETYPE.INDIRECT: charge += map[? ULTIMATE_CASTING_MAP.CHARGE_INDIRECT]; break;
		case DAMAGETYPE.TIME: charge += map[? ULTIMATE_CASTING_MAP.CHARGE_TIME]; break;
	}
	map[? ULTIMATE_CASTING_MAP.CHARGE] = !global.devmode ? min(map[? ULTIMATE_CASTING_MAP.CHARGE] + ((charge * 
		(map[? ULTIMATE_CASTING_MAP.CHARGE_MULTI] + (combo_map[? COMBO_MAP.STREAK] + 1))) * multi), 
			map[? ULTIMATE_CASTING_MAP.CHARGE_MAX]) : map[? ULTIMATE_CASTING_MAP.CHARGE_MAX];
}


enum DAMAGETYPE {
	DIRECT, SPLASH, INDIRECT, TIME
}