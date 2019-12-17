/// @desc load chunks
with (oPlayer) {
	for (var i = -2; i <= 2; i++) {
		var _chunk_id = (x div CHUNK_SIZE) + i;
		with (other) {
			var cached = ds_map_exists(chunks_map, _chunk_id);
			var load = !cached;
			if (cached) {
				var _map = chunks_map[? _chunk_id];
				if (!_map[? CHUNK_MAP.LOADED]) //Not loaded, but previously was
					load = true;
			}
			if (load) {
				var _chunk = instance_create_depth(_chunk_id * CHUNK_SIZE, 0, depth, oGenChunk);
				var _chunk_map = !cached ? ds_map_create() : chunks_map[? _chunk_id];
				_chunk_map[? CHUNK_MAP.ID] = _chunk_id;
				_chunk_map[? CHUNK_MAP.OBJECT] = _chunk;
				if (!cached)
					_chunk_map[? CHUNK_MAP.GRID] = noone;
				else
					_chunk.chunk_grid = _chunk_map[? CHUNK_MAP.GRID];
				_chunk_map[? CHUNK_MAP.LOADED] = true;
				_chunk.chunk_id = _chunk_id;
				ds_map_add(chunks_map, _chunk_id, _chunk_map);
				show_debug_message("+ Chunk loaded ID: " + string(_chunk_id));
			}
		}
	}
}

alarm[0] = room_speed;