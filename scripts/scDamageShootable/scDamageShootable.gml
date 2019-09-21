/// @desc Hit a shootable
/// @arg damager
/// @arg damaging
/// @arg delete-the-hitting-object
/// @arg play-sound-hit
/// @arg damage
/// @arg force-damage* noone to ignore
/// @arg damage-type* noone to ignore
/// @arg combo-count* noone to ignore

var damager = argument[0];
var damaging = argument[1];
var isPlayer = damaging.object_index == oPlayer; //If the damaging instance is a player
var delete = argument[2];
var dmg = argument[4];
var force = argument_count > 5 ? (argument[5] != noone ? argument[5] : false) : false;
var type = argument_count > 6 ? (argument[6] != noone ? argument[6] : DAMAGETYPE.DIRECT) : DAMAGETYPE.DIRECT;
var combo =  argument_count > 7 ? (argument[7] != noone ? argument[7] : true) : true;
var didDamage = false;
var lethalDamage = false;

if (damager.object_index == oPlayer)
	with (damager)
		if (scBuffFind(id, BUFFTYPE.DAMAGE, false))
			dmg = scBuffHandler(BUFF_EVENT.DAMAGE_PREAPPLY, dmg);

with (damaging) {
	var map = shootable_map;
	if (map[? SHOOTABLE_MAP.CAN_DAMAGE] || force) {
		map[? SHOOTABLE_MAP.HEALTH] -= dmg;
		
		if (map[? SHOOTABLE_MAP.HEALTH] <= 0)
			lethalDamage = true;
			
		if (isPlayer) {
			hp_scale = 2;
			player_map[? PLAYER_MAP.DAMAGE_LAST] = dmg;
			player_map[? PLAYER_MAP.FLASH_HEALTH_ALPHA] = 1;
			scBuffHandler(BUFF_EVENT.DAMAGE_TAKEN, [damager, dmg]);
			with (damager)
				if (object_index == oPlayer) //Is a player
					scBuffHandler(BUFF_EVENT.DAMAGE_APPLIED, [damaging, dmg]);
		}
		map[? SHOOTABLE_MAP.SHOOTER] = damager; //The person who shot them
		didDamage = true;
		scPlaySound(SOUND.EFFECT_HIT);
	}
	if (isPlayer) { //Do this thing no matter what
		player_map[? PLAYER_MAP.FLASH_ALPHA] = 1;
		//Damage Numbers
		if (player_map[? PLAYER_MAP.ALIVE]) //Alive? Show damage indicators
			with (instance_create_depth(x, y, depth - 1, oPartDamageNum)) {
				value_damage = dmg;
				damage_type = type;
				damage_killed = lethalDamage;
				if (combo && damager.object_index == oPlayer)
					id.combo = damager.combo_map[? COMBO_MAP.STREAK];
			}
		if (combo)
			scComboDamaged(damager);
		scSpawnParticle(x, bbox_top, irandom_range(4 * power(dmg, 2), 6 * power(dmg, 2)));
	}
}

if (didDamage && delete)
	instance_destroy(other);
	
if (isPlayer && damaging.causeOfDeath != noone)
	lethalDamage = false;
	
return lethalDamage;