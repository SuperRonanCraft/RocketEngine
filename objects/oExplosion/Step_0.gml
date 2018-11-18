/// @desc hurt the players in the hitlist
//ADD BUFF BY DEFAULT
for (var i = 0; i < ds_list_size(hitList); i++)
	if (ds_list_find_index(confirmList, hitList[| i]) == -1) {
		ds_list_add(confirmList, hitList[| i]);
		with (hitList[| i])
			scHitShootable(other.parent, false, true);
		if (rocket_map[? ROCKET_MAP.BUFF] != noone)
			scAddBuff(rocket_map[? ROCKET_MAP.BUFF], hitList[| i]);
	}
if (rocket_map[? ROCKET_MAP.EXPLOSION_STEP] != noone)
	script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_STEP]);