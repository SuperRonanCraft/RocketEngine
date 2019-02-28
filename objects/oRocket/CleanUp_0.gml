/// @desc Clean up list and remove owners rocket amount
with (owner)
	rockets--;
ds_list_destroy(hitList);
ds_list_destroy(confirmList);

if (rocket_map[? ROCKET_MAP.ROCKET_DESTROY] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_DESTROY]);

if (ds_exists(rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS], ds_type_list))
	ds_list_destroy(rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS]);
ds_map_destroy(rocket_map);