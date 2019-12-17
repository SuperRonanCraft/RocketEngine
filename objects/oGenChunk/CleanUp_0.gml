/// @desc clean chunk

for (var i = 0; i < ds_list_size(chunk_walls); i++)
	with(chunk_walls[| i])
		instance_destroy();
surface_free(chunk_surface);
ds_list_destroy(chunk_walls);