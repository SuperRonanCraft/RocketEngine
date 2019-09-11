/// @desc Clean up list and remove owners rocket amount

event_inherited();

ds_list_destroy(hitList);
ds_list_destroy(confirmList);

if (rocket_map[? ROCKET_MAP.ROCKET_DESTROY] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_DESTROY]);

ds_map_destroy(rocket_map);