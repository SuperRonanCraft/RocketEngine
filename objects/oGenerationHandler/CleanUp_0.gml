/// @desc
var first = ds_map_find_first(chunks_map), last = ds_map_find_last(chunks_map);

var current = first;
repeat(ds_map_size(chunks_map)) {
	current = ds_map_find_next(chunks_map, first);
	if (current < first)
		first = current;
	else if (current > last)
		last = current;
}

for (var i = first; i < last; i++) {
	if (ds_grid_)
}

ds_map_destroy(chunks_map);