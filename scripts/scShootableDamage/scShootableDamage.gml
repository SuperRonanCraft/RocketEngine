/// @desc Hit a shootable
/// @arg damager
/// @arg damaging
/// @arg delete-the-hitting-object
/// @arg play-sound-hit
/// @arg damage
/// @arg force-damage* noone to ignore
/// @arg damage-type* noone to ignore
/// @arg combo-apply* noone to ignore
/// @arg damage-type* noone to ignore

var damager = argument[0];
var damaging = argument[1];
var isPlayer = scGetParent(oPlayer, damaging); //If the damaging instance is a player
var delete = argument[2];
var dmg = argument[4];
var force = argument_count > 5 ? (argument[5] != noone ? argument[5] : false) : false;
var type = argument_count > 6 ? (argument[6] != noone ? argument[6] : DAMAGETYPE.DIRECT) : DAMAGETYPE.DIRECT;
var combo = argument_count > 7 ? (argument[7] != noone ? argument[7] : true) : true;
var damage_type = argument_count > 8 ? (argument[8] != noone ? argument[8] : true) : true;
var didDamage = false;
var lethalDamage = false;

if (damager != noone && scGetParent(oPlayer, damager))
	with (damager)
		if (scBuffFind(id, BUFFTYPE.DAMAGE, false))
			dmg = scBuffHandler(BUFF_EVENT.DAMAGE_PREAPPLY, dmg);

with (damaging) {
	var map = shootable_map;
	if (map[? SHOOTABLE_MAP.CAN_DAMAGE] || force) {
		//for (var i = 0; i < dmg ; i++) {
		var _dmg_left = dmg;
		var _dmg_inflicted = 0;
		if (map[? SHOOTABLE_MAP.HEALTH_SHIELD] > 0) {
			if (_dmg_left > map[? SHOOTABLE_MAP.HEALTH_SHIELD]) {
				_dmg_left -= map[? SHOOTABLE_MAP.HEALTH_SHIELD];
				_dmg_inflicted += map[? SHOOTABLE_MAP.HEALTH_SHIELD];
				map[? SHOOTABLE_MAP.HEALTH_SHIELD] = 0;
			} else {
				map[? SHOOTABLE_MAP.HEALTH_SHIELD] -= _dmg_left;
				_dmg_inflicted += _dmg_left;
				_dmg_left = 0;
				scPlaySound(SOUND.ULT_TELEPORT_USE);
			}
		}
		
		if (map[? SHOOTABLE_MAP.HEALTH_ARMOR] > 0 && _dmg_left > 0) {
			var _dmg_to_take = 0;
			if (_dmg_left > map[? SHOOTABLE_MAP.HEALTH_ARMOR]) {
				_dmg_to_take = floor(_dmg_left - (map[? SHOOTABLE_MAP.HEALTH_ARMOR] * map[? SHOOTABLE_MAP.ARMOR_DAMAGEREDUCTION]));	
				//_dmg_remaining = _dmg_remaining - (_dmg_remaining * map[? SHOOTABLE_MAP.ARMOR_DAMAGEREDUCTION]);
			} else {
				_dmg_to_take = floor(_dmg_left * map[? SHOOTABLE_MAP.ARMOR_DAMAGEREDUCTION]);	
			}
				
			var _armor_left = floor(map[? SHOOTABLE_MAP.HEALTH_ARMOR] - _dmg_to_take);
			if (_armor_left > 0) { //Still has armor
				map[? SHOOTABLE_MAP.HEALTH_ARMOR] = _armor_left;
				scPlaySound(SOUND.EFFECT_REFLECT);
				//dmg = _dmg_left + dmg;
				_dmg_left = 0;
			} else { //Used up all armor, take the rest of dmg in health
				scPlaySound(SOUND.ULT_SHIELD_BREAK);
				map[? SHOOTABLE_MAP.HEALTH_ARMOR] = 0;
				//dmg = dmg - (dmg - _dmg_left);
				_dmg_left = abs(_armor_left);
			}
			_dmg_inflicted += _dmg_to_take - _dmg_left;
		}
		
		if (map[? SHOOTABLE_MAP.HEALTH_BASE] > 0 && _dmg_left > 0) {
			map[? SHOOTABLE_MAP.HEALTH_BASE] -= _dmg_left;
			_dmg_inflicted += _dmg_left;
		}
		
		dmg = _dmg_inflicted;
		//}
		map[? SHOOTABLE_MAP.DAMAGE_TYPE] = damage_type; //Damage type we just took
		map[? SHOOTABLE_MAP.HEALTH] = map[? SHOOTABLE_MAP.HEALTH_BASE] + map[? SHOOTABLE_MAP.HEALTH_SHIELD] + map[? SHOOTABLE_MAP.HEALTH_ARMOR]
		if (map[? SHOOTABLE_MAP.HEALTH] <= 0) {
			lethalDamage = true;
			map[? SHOOTABLE_MAP.HEALTH_BASE] = 0;
			map[? SHOOTABLE_MAP.HEALTH_SHIELD] = 0;
			map[? SHOOTABLE_MAP.HEALTH_ARMOR] = 0;
		}
			
		if (isPlayer) {
			if (gamepad_is_connected(keys)) {
				gamepad_set_vibration(keys, 1, 1);
				alarm[0] = room_speed / 2;
			}
			player_map[? PLAYER_MAP.DAMAGE_LAST] = dmg;
			//health_map[? HEALTH_MAP.FLASH_ALPHA] = 1;
			scBuffHandler(BUFF_EVENT.DAMAGE_TAKEN, [damager, dmg]);
			if (damager != noone)
				with (damager)
					if (object_index == oPlayer) //Is a player
						scBuffHandler(BUFF_EVENT.DAMAGE_APPLIED, [damaging, dmg]);
		}
		didDamage = true;
		scPlaySound(SOUND.EFFECT_HIT);
	}
	if (isPlayer) { //Do this thing no matter what
		player_map[? PLAYER_MAP.FLASH_ALPHA] = 1;
		//Damage Numbers
		if (damager != noone && combo)
			scComboDamaged(damager);
		scSpawnParticle(x, bbox_top, ceil(dmg * 1.3), 20, spBlood, WORLDPART_TYPE.BLOOD);
	}
	
	//Damage Animation
	if (map[? SHOOTABLE_MAP.HEALTH] + dmg > 0) {
		var _dmgmap = ds_map_create();
		_dmgmap[? "dmg"] = dmg;
		_dmgmap[? "size"] = 1;
		_dmgmap[? "alpha"] = 1;
		_dmgmap[? "color"] = c_red;
		ds_list_add(health_map[? HEALTH_MAP.DAMAGE_MAP], _dmgmap);
		//health_map[? HEALTH_MAP.DAMAGE_MAP] = 1 / (health_map[? HEALTH_MAP.DAMAGE] * 6);
		health_map[? HEALTH_MAP.HEAL] -= dmg;
		health_map[? HEALTH_MAP.DAMAGE_TIME] = 0;
	}
	map[? SHOOTABLE_MAP.SHOOTER] = damager; //The person who shot them
	var show_dmg = map[? SHOOTABLE_MAP.SHOW_DAMAGE];
	if (show_dmg) {
		if (!isPlayer || (isPlayer && player_map[? PLAYER_MAP.ALIVE])) //Alive? Show damage indicators
			with (instance_create_depth(x, y, depth - 1, oPartDamageNum)) {
				value_damage = abs(floor(dmg));
				damage_type = type;
				damage_killed = lethalDamage;
				//if (damager != noone && combo && damager.object_index == oPlayer)
				//	id.combo = damager.combo_map[? COMBO_MAP.STREAK];
			}
	}
	map[? SHOOTABLE_MAP.TIME_SINCE_DAMAGE] = 0; //We just got damaged
}

if (didDamage && delete)
	instance_destroy(other);
	
if (isPlayer && damaging.causeOfDeath != noone)
	lethalDamage = false;
	
return lethalDamage;

enum DAMAGE_TYPE {
	COLD, FIRE, SLIME
}