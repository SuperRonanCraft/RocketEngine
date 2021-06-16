/// @description Add to hitlist

if (instance_exists(owner) && other.id == owner.id) exit; //Self damage, dont.. do that..

//Add yourself to the list of collisions the explosion checks
if (instance_exists(owner) && global.play && owner.team != other.team)
	if (ds_list_find_index(hitList, other) == -1)
		ds_list_add(hitList, other);