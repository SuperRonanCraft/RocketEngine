/// @desc Hit a shootable
/// @arg shooter-instance
/// @arg delete-the-hitting-object
/// @arg play-sound-hit
/// @arg damage
/// @arg force-damage* noone to ignore
var isPlayer = object_index == oPlayer;
if ((damage_take || (argument_count >= 5 ? (argument[4] != noone ? argument[4] : false) : false))
		&& argument[0] != id && argument[3] > 0) {
	hp -= argument[3];
	if (isPlayer) {
		flash = 3;
		hitfrom = other.direction;
		hp_scale = 2;
		if (hp > 0 || alive)
			scData_ConfirmHit();
	}
	shooter = id; //The person who shot them
	if (argument[1])
		instance_destroy(other.id);
	scPlaySound(SOUND.EFFECT_HIT);
}
if (isPlayer)
	scComboDamaged(argument[0]);