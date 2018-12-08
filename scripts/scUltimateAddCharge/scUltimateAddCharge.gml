/// @desc add charge related to the damage type of a hit
/// @arg damage-type

var charge = 0;
if (argument[0] == DAMAGETYPE.DIRECT)
	charge += ult_charge_direct;
else if (argument[0] == DAMAGETYPE.SPLASH)
	charge += ult_charge_splash;
else if (argument[0] == DAMAGETYPE.INDIRECT)
	charge += ult_charge_indirect;

ult_charge = min(ult_charge + (charge* ult_charge_multiplier), ult_charge_max);

enum DAMAGETYPE {
	DIRECT, SPLASH, INDIRECT
}