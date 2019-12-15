/// @desc 
//show_debug_message("Flattening Level!");

var _w = (CHUNK_SIZE / BLOCK_SIZE);
for (var xx = 0; xx < _w; xx += 1) {
	var _before, _after;
	if (xx == 0 && chunk_id != 0) {
		var _chunk_map = oGenerationHandler.chunks_grid[# chunk_id - 1, 0];
		var _chunk = _chunk_map[? "obj"];
		_before = _chunk.grid[# _w - 1, 0];
	} else if (xx == 0 && chunk_id == 0)
		continue;
	else
		_before = grid[# xx - 1, 0];
	if (xx == _w - 1 && chunk_id != ds_grid_width(oGenerationHandler.chunks_grid) - 1) {
		var _chunk_map = oGenerationHandler.chunks_grid[# chunk_id + 1, 0];
		var _chunk = _chunk_map[? "obj"];
		_after = _chunk.grid[# 0, 0];
	} else if (xx == _w - 1 && chunk_id == ds_grid_width(oGenerationHandler.chunks_grid) - 1)
		continue;
	else
		_after = grid[# xx + 1, 0];
	grid[# xx, 0] = (_before + _after) / 2;
	//grid[# xx, 0]++;
}
for (var xx = 0; xx < _w; xx++) {
	var _h = round(grid[# xx, 0]);
	var wall = instance_create_depth(x + xx * BLOCK_SIZE, _h * BLOCK_SIZE, depth, oWall);
	wall.color = scGenerateColor(grid[# xx, 0]);
	wall.alpha = grid[# xx, 0] / 100;
	var dif = (room_height - y) / BLOCK_SIZE;
	wall.image_yscale = dif;
}