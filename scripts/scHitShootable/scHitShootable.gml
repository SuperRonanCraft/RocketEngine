/// @desc Hit a shootable
/// @arg shooter-instance
/// @arg delete-the-hitting-object
/// @arg play-sound-hit
/// @arg damage
/// @arg force-damage

if ((damage_take || (argument_count >= 5 ? argument[4] : false)) && argument[0] != id && argument[3] > 0) {
	hp -= argument[3];
	flash = 3;
	hitfrom = other.direction;
	if (argument[1])
		instance_destroy(other.id);
	hpscale = 2;
	scPlaySound(SOUND.EFFECT_HIT);
	if (hp > 0 || alive)
		scData_ConfirmHit();
}