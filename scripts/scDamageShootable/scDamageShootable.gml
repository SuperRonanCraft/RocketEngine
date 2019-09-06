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
var lethalDamage = false;

with (damageInst) {
	var map = player_map;
	if ((damage_take /*&& shootInst != id*/) || force) {
		map[? PLAYER_MAP.HEALTH] -= dmg;
		
		if (map[? PLAYER_MAP.HEALTH] <= 0)
			lethalDamage = true;
			
		if (isPlayer) {
			hp_scale = 2;
			map[? PLAYER_MAP.DAMAGE_LAST] = dmg;
			
			map[? PLAYER_MAP.FLASH_HEALTH_ALPHA] = 1;
			scBuffHandler(BUFF_EVENT.DAMAGE_TAKEN, [shootInst, dmg]);
			with (shootInst)
				scBuffHandler(BUFF_EVENT.DAMAGE_APPLIED, [damageInst, dmg]);
		}
		shooter = shootInst; //The person who shot them
		didDamage = true;
		scPlaySound(SOUND.EFFECT_HIT);
	}
	if (isPlayer) { //Do this thing no matter what
		map[? PLAYER_MAP.FLASH_ALPHA] = 1;
		scComboDamaged(shootInst);
	}
}
if (didDamage && delete)
	instance_destroy(other);
	
	
if (damageInst.causeOfDeath != noone)
	lethalDamage = false;
	
return lethalDamage;