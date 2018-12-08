/// @desc add charge related to the damage type of a hit
/// @arg damage-type

var charge = 0;
if (argument[0] == DAMAGETYPE.DIRECT)
	charge += 0.15;
else if (argument[0] == DAMAGETYPE.SPLASH)
	charge += 0.075;
else if (argument[0] == DAMAGETYPE.INDIRECT)
	charge += 0.01;

ult_charge = min(ult_charge + charge, ult_charge_max);

enum DAMAGETYPE {
	DIRECT, SPLASH, INDIRECT
}