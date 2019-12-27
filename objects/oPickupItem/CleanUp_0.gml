/// @desc 
if (item_map != noone)
	ds_map_destroy(item_map);

if (item_particle != noone)
	with (item_particle)
		instance_destroy();