/// @desc load chunks
with (oPlayer) {
	for (var i = -1; i <= 1; i++) {
		var _chunk_id = (x div CHUNK_SIZE) + i;
		with (other) {
			if (!ds_map_exists(chunks_map, _chunk_id)) {
				var _chunk = instance_create_depth(_chunk_id * CHUNK_SIZE, 0, depth, oGenChunk);
				var _chunk_map = ds_map_create();
				_chunk_map[? CHUNK_MAP.ID] = _chunk_id;
				_chunk_map[? CHUNK_MAP.OBJECT] = _chunk;
				_chunk.chunk_id = _chunk_id;
				ds_map_add(chunks_map, _chunk_id, _chunk_map);
				show_debug_message("+ Chunk loaded ID: " + string(_chunk_id));
			}
		}
	}
}

alarm[0] = room_speed;