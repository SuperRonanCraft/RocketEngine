/// @desc Hit a shootable
/// @arg shooter-instance
/// @arg delete-the-hitting-object
/// @arg play-sound-hit
/// @arg damage
/// @arg force-damage* noone to ignore

var isPlayer = object_index == oPlayer; //If the damaginf instance is a player
var shootInst = argument[0];
var delete = argument[1];
var dmg = argument[3];
var force = argument_count >= 5 ? (argument[4] != noone ? argument[4] : false) : false;
if ((damage_take /*&& shootInst != id*/) || force) {
	hp -= dmg;
	if (isPlayer) {
		flash = 3;
		hitfrom = other.direction;
		hp_scale = 2;
		if (hp > 0 || alive)
			scData_ConfirmHit();
	}
	shooter = shootInst; //The person who shot them
	if (delete)
		instance_destroy(other.id);
	scPlaySound(SOUND.EFFECT_HIT);
}
if (isPlayer)
	scComboDamaged(argument[0]);