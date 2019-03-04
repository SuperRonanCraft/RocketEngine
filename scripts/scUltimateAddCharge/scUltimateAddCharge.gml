/// @desc add charge related to the damage type of a hit
/// @arg charging
/// @arg damage-type*
/// @arg multiplier* direct multiplier for each instance

var inst = argument[0];
var type = argument_count > 2 ? (argument[2] != noone ? argument[2] : DAMAGETYPE.DIRECT) : DAMAGETYPE.DIRECT; //Damage type
var multi = argument_count > 3 ? argument[3] : 1; //Multiplier
var charge = 0;

with (inst) {
	switch (argument[1]) {
		case DAMAGETYPE.DIRECT: charge += ult_charge_direct; break;
		case DAMAGETYPE.SPLASH: charge += ult_charge_splash; break;
		case DAMAGETYPE.INDIRECT: charge += ult_charge_indirect; break;
		case DAMAGETYPE.TIME: charge += ult_charge_time; break;
	}
	ult_charge = !global.devmode ? min(ult_charge + ((charge * 
		(ult_charge_multiplier + (combo_amount + 1))) * multi), 
			ult_charge_max) : ult_charge_max;
}


enum DAMAGETYPE {
	DIRECT, SPLASH, INDIRECT, TIME
}