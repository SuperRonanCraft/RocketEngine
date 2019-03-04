/// @desc Hit a shootable
/// @arg damager
/// @arg damaging
/// @arg delete-the-hitting-object
/// @arg play-sound-hit
/// @arg damage
/// @arg force-damage* noone to ignore


var shootInst = argument[0];
var damageInst = argument[1];
var isPlayer = damageInst.object_index == oPlayer; //If the damaging instance is a player
var delete = argument[2];
var dmg = argument[4];
var force = argument_count > 5 ? (argument[5] != noone ? argument[5] : false) : false;
var didDamage = false;

with (damageInst) {
	if ((damage_take /*&& shootInst != id*/) || force) {
		hp -= dmg;
		if (isPlayer) {
			hp_scale = 2;
			hp_damaged = dmg;
			hp_flash_alpha = 1;
			if (hp > 0 || alive)
				scData_ConfirmHit();
		}
		shooter = shootInst; //The person who shot them
		didDamage = true;
		scPlaySound(SOUND.EFFECT_HIT);
	}
	if (isPlayer) { //Do thing no matter taking damage or not
		flash_alpha = 1;
		scComboDamaged(shootInst);
	}
}
if (didDamage && delete)
	instance_destroy(other);