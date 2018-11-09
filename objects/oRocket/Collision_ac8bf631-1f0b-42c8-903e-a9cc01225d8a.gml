/// @desc hit another rocket
//If the rocket is not from the same shooter
if (other.owner != owner) {
	instance_change(oHitSpark, true);
	with (other)
		instance_change(oHitSpark, true);
}