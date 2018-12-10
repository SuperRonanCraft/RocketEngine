/// @desc add charge related to the damage type of a hit
/// @arg damage-type

var charge = 0;
switch (argument[0]) {
	case DAMAGETYPE.DIRECT: charge += ult_charge_direct; break;
	case DAMAGETYPE.SPLASH: charge += ult_charge_splash; break;
	case DAMAGETYPE.INDIRECT: charge += ult_charge_indirect; break;
	case DAMAGETYPE.TIME: charge += ult_charge_time; break;
}
ult_charge = min(ult_charge + (charge* ult_charge_multiplier), ult_charge_max);

enum DAMAGETYPE {
	DIRECT, SPLASH, INDIRECT, TIME
}