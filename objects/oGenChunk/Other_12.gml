/// @desc Flatten Level
if (!chunk_flatten) exit;
show_debug_message("Flattening Chunk ID: " + string(chunk_id[0]) + " " + string(chunk_id[1]));
var o_chunk_grid = oGenerationHandler.chunks_grid;
repeat (chunk_flatness)
	for (var xx = 0; xx < chunk_size; xx++) {
		var _before = undefined, _after = undefined;
		if (xx == 0 && chunk_id[0] - 1 >= 0 && o_chunk_grid[# chunk_id[0] - 1, chunk_id[1]] != 0) { //Grab the before block from last chunk
			var _chunk_map = o_chunk_grid[# chunk_id[0] - 1, chunk_id[1]];
			//var _chunk_map = o_chunk_map[? chunk_id - 1];
			if (_chunk_map[? CHUNK_MAP.LOADED]) {
				var _chunk = _chunk_map[? CHUNK_MAP.OBJECT];
				_before = _chunk.chunk_noise[? chunk_size - 1];
			} else
				continue;
		} else if (xx == 0 && chunk_id[0] - 1 >= 0 && o_chunk_grid[# chunk_id[0] - 1, chunk_id[1]] == 0)
			continue;
		if (_before == undefined)
			_before = chunk_noise[? xx - 1];
		if (xx == chunk_size - 1 && chunk_id[0] + 1 < 128 && o_chunk_grid[# chunk_id[0] + 1, chunk_id[1]] != 0) {
			var _chunk_map = o_chunk_grid[# chunk_id[0] + 1, chunk_id[1]];
			if (_chunk_map[? CHUNK_MAP.LOADED]) {
				var _chunk = _chunk_map[? CHUNK_MAP.OBJECT];
				_after = _chunk.chunk_noise[? 0];
			} else
				continue;
		} else if (xx == chunk_size - 1 && chunk_id[0] + 1 < 128 && o_chunk_grid[# chunk_id[0] - 1, chunk_id[1]] == 0)
			continue;
		if (_after == undefined)
			_after = chunk_noise[? xx + 1];
		if (_after != undefined && _before != undefined) {
			//show_debug_message("Flattening Chunk ID: " + string(chunk_id) + " " + string(xx));
			chunk_noise[? xx] = (_before + _after) / 2;
		}
		//grid[# xx, 0]++;
	}