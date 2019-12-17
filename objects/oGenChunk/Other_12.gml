/// @desc Flatten Level
if (!chunk_flatten) exit;
var o_chunk_map = oGenerationHandler.chunks_map;
var _w = (CHUNK_SIZE / BLOCK_SIZE);
repeat (chunk_flatness)
	for (var xx = 0; xx < _w; xx++) {
		var _before = undefined, _after = undefined;
		if (xx == 0 && ds_map_exists(o_chunk_map, chunk_id - 1)) {
			var _chunk_map = o_chunk_map[? chunk_id - 1];
			if (_chunk_map[? CHUNK_MAP.LOADED]) {
				var _chunk = _chunk_map[? CHUNK_MAP.OBJECT];
				_before = _chunk.chunk_grid[# _w - 1, 0];
			} else
				continue;
		} else if (xx == 0 && !ds_map_exists(o_chunk_map, chunk_id - 1))
			continue;
		if (_before == undefined)
			_before = chunk_grid[# xx - 1, 0];
		if (xx == _w - 1 && ds_map_exists(o_chunk_map, chunk_id + 1)) {
			var _chunk_map = o_chunk_map[? chunk_id + 1];
			if (_chunk_map[? CHUNK_MAP.LOADED]) {
				var _chunk = _chunk_map[? CHUNK_MAP.OBJECT];
				_after = _chunk.chunk_grid[# 0, 0];
			} else
				continue;
		} else if (xx == _w - 1 && !ds_map_exists(o_chunk_map, chunk_id + 1))
			continue;
		if (_after == undefined)
			_after = chunk_grid[# xx + 1, 0];
		if (_after != undefined && _before != undefined) {
			show_debug_message("Flattening Chunk ID: " + string(chunk_id) + " " + string(xx));
			chunk_grid[# xx, 0] = (_before + _after) / 2;
		}
		//grid[# xx, 0]++;
	}