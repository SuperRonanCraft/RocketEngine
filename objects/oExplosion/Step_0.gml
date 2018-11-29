/// @desc hurt the players in the hitlist
/// run custom step event and destory 
if (doing_damage)
	for (var i = 0; i < ds_list_size(hitList); i++)
		if (ds_list_find_index(confirmList, hitList[| i]) == -1) {
			ds_list_add(confirmList, hitList[| i]);
			var dmg = rocket_map[? ROCKET_MAP.DAMAGE];
			if (dmg != -1 && rocket_map[? ROCKET_MAP.DAMAGE_EXPLOSION] != 0)
				dmg = rocket_map[? ROCKET_MAP.DAMAGE_EXPLOSION];
			with (hitList[| i]) 
				scHitShootable(other.parent, false, true, dmg);
			if (rocket_map[? ROCKET_MAP.BUFF] != noone)
				scAddBuff(rocket_map[? ROCKET_MAP.BUFF], hitList[| i]);
		}
if (rocket_map[? ROCKET_MAP.EXPLOSION_STEP] != noone)
	script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_STEP]);
if (destroy && image_speed == 0)
	instance_destroy();