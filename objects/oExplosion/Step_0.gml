/// @desc hurt the players in the hitlist

for (var i = 0; i < ds_list_size(hitList); i++)
	if (ds_list_find_index(confirmList, hitList[| i]) == -1) {
		ds_list_add(confirmList, hitList[| i]);
		with (hitList[| i])
			scHitShootable(other.parent, false, true);
		if (buff != noone)
			scAddBuff(buff, hitList[| i]);
	}