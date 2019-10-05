/// @desc 

for (var i = 0; i < ds_map_size(ds_part); i++)
	part_type_destroy(ds_part[? i]);
ds_map_destroy(ds_part);
ds_map_destroy(ds_part_amt);