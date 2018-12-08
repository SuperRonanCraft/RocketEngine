/// @desc Adding ult charge
/// @arg damager-instance
/// @arg damage-type*

with (argument[0])
	scUltimateAddCharge(argument_count > 1 ? argument[1] : DAMAGETYPE.DIRECT);