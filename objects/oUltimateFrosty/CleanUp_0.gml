/// @desc clean up
for (var i = 0; i < ds_list_size(frozen_walls); i++)
	ds_map_destroy(frozen_walls[| i]);

ds_list_destroy(frozen_walls);