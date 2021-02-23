/// @desc add charge related to the damage type of a hit
/// @arg charging-instance
/// @arg damage-type
/// @arg multiplier* direct multiplier for each instance
function scUltimateAddCharge() {

	var inst = argument[0];
	if (!inst.system_ultimate) exit;
	var type = argument_count > 1 ? (argument[1] != noone ? argument[1] : DAMAGE_TYPE.DIRECT) : DAMAGE_TYPE.DIRECT; //Damage type
	var multi = argument_count > 2 ? argument[2] : 1; //Multiplier
	var charge = 0;
	var map = inst.ultimate_map;

	with (inst) {
		switch (type) {
			case DAMAGE_TYPE.DIRECT: charge += map[? ULTIMATE_CASTING_MAP.CHARGE_DIRECT]; break;
			case DAMAGE_TYPE.SPLASH: charge += map[? ULTIMATE_CASTING_MAP.CHARGE_SPLASH]; break;
			case DAMAGE_TYPE.INDIRECT: charge += map[? ULTIMATE_CASTING_MAP.CHARGE_INDIRECT]; break;
			case DAMAGE_TYPE.TIME: charge += map[? ULTIMATE_CASTING_MAP.CHARGE_TIME]; break;
		}
		map[? ULTIMATE_CASTING_MAP.CHARGE] = !global.devmode ? min(map[? ULTIMATE_CASTING_MAP.CHARGE] + ((charge * 
			(map[? ULTIMATE_CASTING_MAP.CHARGE_MULTI] + (combo_map[? COMBO_MAP.STREAK] + 1))) * multi), 
				map[? ULTIMATE_CASTING_MAP.CHARGE_MAX]) : map[? ULTIMATE_CASTING_MAP.CHARGE_MAX];
	}


}
