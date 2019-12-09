/// @desc Hit a shootable
/// @arg damager
/// @arg damaging
/// @arg delete-the-hitting-object
/// @arg play-sound
/// @arg damage (Amount to damage)
/// @arg force-damage* noone to ignore (Force even if we can't take damage)
/// @arg damage_from* noone to ignore (Source of damage)
/// @arg combo-apply* noone to ignore
/// @arg damage_element* noone to ignore (Damage infliction type)

var damager = argument[0];
var damaging = argument[1];
var isPlayer = scGetParent(oPlayer, damaging); //If the damaging instance is a player
var delete = argument[2];
var dmg = argument[4];
var force = argument_count > 5 ? (argument[5] != noone ? argument[5] : false) : false;
var _damage_type = argument_count > 6 ? (argument[6] != noone ? argument[6] : DAMAGE_TYPE.DIRECT) : DAMAGE_TYPE.DIRECT;
var combo = argument_count > 7 ? (argument[7] != noone ? argument[7] : true) : true;
var _damage_element = argument_count > 8 ? (argument[8] != noone ? argument[8] : DAMAGE_ELEMENT.NONE) : DAMAGE_ELEMENT.NONE;
var didDamage = false;
var lethalDamage = false;

if (dmg < 0) { //Negative damage
	scShootableHeal(damaging, abs(dmg), true);
	exit;
}

if (damager != noone && scGetParent(oPlayer, damager))
	with (damager)
		if (scBuffFind(id, BUFFTYPE.DAMAGE, false))
			dmg = scBuffHandler(BUFF_EVENT.DAMAGE_PREAPPLY, dmg);

with (damaging) {
	var _dmg_took = DAMAGE_TOOK.HEALTH;
	var map = shootable_map;
	if (map[? SHOOTABLE_MAP.CAN_DAMAGE] || force) {
		map[? SHOOTABLE_MAP.DAMAGE_TYPE] = _damage_type; //Damage type we just took
		map[? SHOOTABLE_MAP.DAMAGE_ELEMENT] = _damage_element; //Damage type we just took
		
		//---------------
		//Health Type modifiers
		//---------------
		var _dmg_left = dmg;
		var _dmg_inflicted = 0;
		if (map[? SHOOTABLE_MAP.HEALTH_SHIELD] > 0) {
			
			part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_gaussian);
			part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SHIELD_DAMAGE], _dmg_left);
			
			if (_dmg_left > map[? SHOOTABLE_MAP.HEALTH_SHIELD]) {
				_dmg_left -= map[? SHOOTABLE_MAP.HEALTH_SHIELD];
				_dmg_inflicted += map[? SHOOTABLE_MAP.HEALTH_SHIELD];
				map[? SHOOTABLE_MAP.HEALTH_SHIELD] = 0;
				scPlaySound(SOUND.UI_SELECT);
				scSpawnParticle(x, bbox_top, ceil(_dmg_inflicted * 1.3 + 10), 10, spShield, WORLDPART_TYPE.SHIELD);
			} else {
				map[? SHOOTABLE_MAP.HEALTH_SHIELD] -= _dmg_left;
				_dmg_inflicted += _dmg_left;
				
				scPlaySound(SOUND.ULT_TELEPORT_USE);
				_dmg_left = 0;
			}
			
			if (_dmg_inflicted > _dmg_left) //Took mostly shield damage
				_dmg_took = DAMAGE_TOOK.SHIELD;
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
			var _armor_taken = map[? SHOOTABLE_MAP.HEALTH_ARMOR] - _armor_left;
			
			part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_gaussian);
			part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.ARMOR_DAMAGE], _dmg_left);
			
			if (_armor_left > 0) { //Still has armor
				map[? SHOOTABLE_MAP.HEALTH_ARMOR] = _armor_left;
				scPlaySound(SOUND.EFFECT_REFLECT);
				//Took mostly armor damage
				if (_armor_taken > _dmg_to_take || _armor_taken > _dmg_inflicted || _dmg_to_take > _dmg_inflicted)
					_dmg_took = DAMAGE_TOOK.ARMOR;
				_dmg_left = 0;
				
			} else { //Used up all armor, take the rest of dmg in health
				scSpawnParticle(x, bbox_top, ceil(_dmg_left * 1.3 + 10), 20, spArmor, WORLDPART_TYPE.ARMOR);
				scPlaySound(SOUND.ULT_SHIELD_BREAK);
				map[? SHOOTABLE_MAP.HEALTH_ARMOR] = 0;
				//Took mostly armor damage
				if (_armor_taken > _dmg_left && _armor_taken > _dmg_inflicted)
					_dmg_took = DAMAGE_TOOK.ARMOR;
				_dmg_left = abs(_armor_left);
			}
				
			//Damage inflicted
			_dmg_inflicted += _dmg_to_take - _dmg_left;
		}
		
		if (map[? SHOOTABLE_MAP.HEALTH_BASE] > 0 && _dmg_left > 0) {
			map[? SHOOTABLE_MAP.HEALTH_BASE] -= _dmg_left;
			if (_dmg_inflicted > _dmg_left) //Took mostly health damage
				_dmg_took = DAMAGE_TOOK.HEALTH;
			_dmg_inflicted += _dmg_left;
			
			part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_gaussian);
			part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.HEALTH_DAMAGE], _dmg_left*1.5);
		}
		
		dmg = _dmg_inflicted; //Total damage we just took
		
		//--------------
		//Damage side effects
		//--------------
		map[? SHOOTABLE_MAP.HEALTH] = map[? SHOOTABLE_MAP.HEALTH_BASE] + map[? SHOOTABLE_MAP.HEALTH_SHIELD] + map[? SHOOTABLE_MAP.HEALTH_ARMOR]
		if (map[? SHOOTABLE_MAP.HEALTH] <= 0) {
			lethalDamage = true;
			scSpawnParticle(x, bbox_top, ceil(_dmg_inflicted * 1.3+20), 20, spBlood, WORLDPART_TYPE.BLOOD);
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
	//Do this no matter if damage is being inflicted on us or not
	if (isPlayer) {
		player_map[? PLAYER_MAP.FLASH_ALPHA] = 1;
		//Blood
		if (damager != noone && combo)
			scComboDamaged(damager);
	}
	
	//Damage Animation
	if (map[? SHOOTABLE_MAP.HEALTH] + dmg > 0) {
		var _dmgmap = ds_map_create();
		_dmgmap[? "dmg"] = dmg;
		_dmgmap[? "size"] = 1;
		_dmgmap[? "alpha"] = 1;
		
		var _c = c_red;
		if (_dmg_took == DAMAGE_TOOK.ARMOR)
			_c = c_orange;
		else if (_dmg_took == DAMAGE_TOOK.SHIELD)
			_c = c_aqua;
		
		_dmgmap[? "color"] = _c;
		ds_list_add(health_map[? HEALTH_MAP.DAMAGE_MAP], _dmgmap);
		//health_map[? HEALTH_MAP.DAMAGE_MAP] = 1 / (health_map[? HEALTH_MAP.DAMAGE] * 6);
		health_map[? HEALTH_MAP.HEAL] -= dmg;
		health_map[? HEALTH_MAP.DAMAGE_TIME] = health_map[? HEALTH_MAP.SHOW_TIME];
	}
	map[? SHOOTABLE_MAP.SHOOTER] = damager; //The person who shot them
	var show_dmg = map[? SHOOTABLE_MAP.SHOW_DAMAGE];
	if (show_dmg) {
		if (!isPlayer || (isPlayer && player_map[? PLAYER_MAP.ALIVE]) && dmg > 0) //Alive? Show damage indicators
			with (instance_create_depth(x, y, depth - 1, oPartDamageNum)) {
				value_damage = abs(floor(dmg));
				damage_type = _damage_type;
				damage_took = _dmg_took;
				damage_killed = lethalDamage;
				//if (damager != noone && combo && damager.object_index == oPlayer)
				//	id.combo = damager.combo_map[? COMBO_MAP.STREAK];
			}
	}
	map[? SHOOTABLE_MAP.TIME_SINCE_DAMAGE] = 0; //We just got damaged
	
	if (isPlayer && !local_player) {
	scNetworkSendHealth(
		map[? SHOOTABLE_MAP.HEALTH_BASE],
		map[? SHOOTABLE_MAP.HEALTH_ARMOR],
		map[? SHOOTABLE_MAP.HEALTH_SHIELD]);
	}
}

if (didDamage && delete)
	instance_destroy(other);
	
if (isPlayer && damaging.causeOfDeath != noone)
	lethalDamage = false;
	
	
return lethalDamage;

enum DAMAGE_ELEMENT { //Damage offset we are taking
	NONE, COLD, FIRE, SLIME
}

enum DAMAGE_TYPE {
	DIRECT, SPLASH, INDIRECT, TIME, CRITICAL, HEALING, NONE
}

enum DAMAGE_TOOK {
	HEALTH, ARMOR, SHIELD
}