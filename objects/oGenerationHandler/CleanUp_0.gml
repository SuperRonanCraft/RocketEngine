/// @desc
for (var xx = 0; xx < ds_grid_width(chunks_grid); xx++)
	for (var yy = 0; yy < ds_grid_width(chunks_grid); yy++) {
		var _map = chunks_grid[# xx, yy];
		if (_map != 0)
			if (_map[? CHUNK_MAP.NOISE] != noone)
				ds_map_destroy(_map[? CHUNK_MAP.NOISE])
	}

ds_grid_destroy(chunks_grid);