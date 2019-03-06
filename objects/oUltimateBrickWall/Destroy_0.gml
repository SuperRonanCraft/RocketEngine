/// @desc remove walls

for (var i = 0; i < ds_list_size(walls_spawned); i++)
	instance_destroy(walls_spawned[| i]);

ds_list_destroy(walls_spawned);