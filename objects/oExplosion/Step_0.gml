/// @desc hurt the players in the hitlist
//if (rocket_map[? ROCKET_MAP.EXPLOSION_STEP] == noone) {
	for (var i = 0; i < ds_list_size(hitList); i++)
		if (ds_list_find_index(confirmList, hitList[| i]) == -1) {
			ds_list_add(confirmList, hitList[| i]);
			with (hitList[| i])
				scHitShootable(other.parent, false, true);
			if (buff != noone)
				scAddBuff(buff, hitList[| i]);
		}
//} else
//	script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_STEP]);