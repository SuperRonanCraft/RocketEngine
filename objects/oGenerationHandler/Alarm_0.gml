/// @desc load chunks
with (pEntity) {
	for (var xx = -2; xx <= 2; xx++) {
		for (var yy = -1; yy <= 1; yy++) {
			var _chunk_id = [x div CHUNK_SIZE + xx, y div CHUNK_SIZE + yy];
			if (_chunk_id[0] >= 0 && _chunk_id[1] >= 0 && _chunk_id[0] < other.chunks_max && _chunk_id[1] < other.chunks_max) {
				with (other) {
					var cached = chunks_grid[# _chunk_id[0], _chunk_id[1]] != 0;
					var load = !cached;
					if (cached) {
						var _map = chunks_grid[# _chunk_id[0], _chunk_id[1]];
						if (!_map[? CHUNK_MAP.LOADED]) //Not loaded, but previously was
							load = true;
					}
					if (load) {
						var _chunk = instance_create_depth(_chunk_id[0] * CHUNK_SIZE, _chunk_id[1] * CHUNK_SIZE, depth, oGenChunk);
						var _chunk_map = !cached ? ds_map_create() : chunks_grid[# _chunk_id[0], _chunk_id[1]];
						//_chunk_map[? CHUNK_MAP.ID] = _chunk_id;
						_chunk_map[? CHUNK_MAP.OBJECT] = _chunk;
						if (!cached)
							_chunk_map[? CHUNK_MAP.NOISE] = noone;
						else
							_chunk.chunk_noise = _chunk_map[? CHUNK_MAP.NOISE];
						_chunk_map[? CHUNK_MAP.LOADED] = false;
						_chunk.chunk_id = _chunk_id;
						ds_grid_set(chunks_grid, _chunk_id[0], _chunk_id[1], _chunk_map);
						show_debug_message("+ Chunk loaded ID: " + string(_chunk_id[0]) + " " + string(_chunk_id[1]));
					}
				}
			}
		}
	}
}

alarm[0] = room_speed;