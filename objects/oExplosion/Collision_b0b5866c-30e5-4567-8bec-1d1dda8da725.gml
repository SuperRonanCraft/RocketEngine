/// @description Add to hitlist

//Add yourself to the list of collisions the explosion checks
if (global.play && parent.team != other.team)
	if (ds_list_find_index(hitList, other) == -1)
		ds_list_add(hitList, other);