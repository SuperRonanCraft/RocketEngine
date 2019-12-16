/// @desc Flatten Level
var o_chunk_map = oGenerationHandler.chunks_map;
var _w = (CHUNK_SIZE / BLOCK_SIZE);
repeat (chunk_flatness)
for (var xx = 0; xx < _w; xx += 1) {
	var _before, _after;
	if (xx == 0 && ds_map_exists(o_chunk_map, chunk_id - 1)) {
		var _chunk_map = o_chunk_map[? chunk_id - 1];
		var _chunk = _chunk_map[? CHUNK_MAP.OBJECT];
		_before = _chunk.chunk_grid[# _w - 1, 0];
	} else if (xx == 0 && !ds_map_exists(o_chunk_map, chunk_id - 1))
		continue;
	else
		_before = chunk_grid[# xx - 1, 0];
	if (xx == _w - 1 && ds_map_exists(o_chunk_map, chunk_id + 1)) {
		var _chunk_map = o_chunk_map[? chunk_id + 1];
		var _chunk = _chunk_map[? CHUNK_MAP.OBJECT];
		_after = _chunk.chunk_grid[# 0, 0];
	} else if (xx == _w - 1 && !ds_map_exists(o_chunk_map, chunk_id + 1))
		continue;
	else
		_after = chunk_grid[# xx + 1, 0];
	chunk_grid[# xx, 0] = (_before + _after) / 2;
	//grid[# xx, 0]++;
}