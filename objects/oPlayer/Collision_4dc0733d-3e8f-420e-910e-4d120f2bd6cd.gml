/// @description Add to hitlist

//Add yourself to the list of collisions the explosion checks
if (global.play && other.parent != id)
	with (other)
		if(ds_list_find_index(hitList, other) == -1)
			ds_list_add(hitList, other);