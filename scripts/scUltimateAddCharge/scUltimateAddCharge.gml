/// @desc add charge related to the damage type of a hit
/// @arg damage-type*
/// @arg multiplier* direct multiplier for each instance

var type = argument_count > 1 ? (argument[1] != noone ? argument[1] : DAMAGETYPE.DIRECT) : DAMAGETYPE.DIRECT; //Damage type
var multi = argument_count > 2 ? argument[2] : 1; //Multiplier
var charge = 0;

switch (argument[0]) {
	case DAMAGETYPE.DIRECT: charge += ult_charge_direct; break;
	case DAMAGETYPE.SPLASH: charge += ult_charge_splash; break;
	case DAMAGETYPE.INDIRECT: charge += ult_charge_indirect; break;
	case DAMAGETYPE.TIME: charge += ult_charge_time; break;
}
ult_charge = min(ult_charge + ((charge * (ult_charge_multiplier + (combo_amount + 1))) * multi), ult_charge_max);

enum DAMAGETYPE {
	DIRECT, SPLASH, INDIRECT, TIME
}