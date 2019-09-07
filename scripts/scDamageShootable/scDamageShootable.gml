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
	var map = shootable_map;
	if ((map[? SHOOTABLE_MAP.CAN_DAMAGE] /*&& shootInst != id*/) || force) {
		map[? SHOOTABLE_MAP.HEALTH] -= dmg;
		
		if (map[? SHOOTABLE_MAP.HEALTH] <= 0)
			lethalDamage = true;
			
		if (isPlayer) {
			player_map[? PLAYER_MAP.HEALTH] = map[? SHOOTABLE_MAP.HEALTH];
			hp_scale = 2;
			player_map[? PLAYER_MAP.DAMAGE_LAST] = dmg;
			player_map[? PLAYER_MAP.FLASH_HEALTH_ALPHA] = 1;
			scBuffHandler(BUFF_EVENT.DAMAGE_TAKEN, [shootInst, dmg]);
			if (object_exists(shootInst) && shootInst.object_index == oPlayer)
				with (shootInst)
					scBuffHandler(BUFF_EVENT.DAMAGE_APPLIED, [damageInst, dmg]);
		}
		map[? SHOOTABLE_MAP.SHOOTER] = shootInst; //The person who shot them
		didDamage = true;
		scPlaySound(SOUND.EFFECT_HIT);
	}
	if (isPlayer) { //Do this thing no matter what
		player_map[? PLAYER_MAP.FLASH_ALPHA] = 1;
		scComboDamaged(shootInst);
	}
}
if (didDamage && delete)
	instance_destroy(other);
	
	
if (isPlayer && damageInst.causeOfDeath != noone)
	lethalDamage = false;
	
return lethalDamage;