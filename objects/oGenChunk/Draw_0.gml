/// @desc 
/*if (!surface_exists(chunk_surface)) {
	chunk_surface = surface_create(CHUNK_SIZE, CHUNK_SIZE);
	surface_set_target(chunk_surface);
	draw_clear_alpha(c_black, 0);
	
	var _chunk_blocks = CHUNK_SIZE / BLOCK_SIZE;
	for (var xx = 0; xx < _chunk_blocks; xx++) {
		for (var yy = 0; yy < room_height / BLOCK_SIZE; yy++) {
			var color = scGenerateColor(grid[# xx, yy]);
			scDrawRect(
				xx * BLOCK_SIZE, 
				yy * BLOCK_SIZE, 
				(xx + 1) * BLOCK_SIZE, 
				(yy + 1) * BLOCK_SIZE, 
				color, 
				false, 
				1);
		}
	}
	surface_reset_target();
}

draw_surface(chunk_surface, x, y);*/
if (global.debug)
	scDrawRect(x, y, x + CHUNK_SIZE, room_height, c_red, true, 1);
/*var _chunk_blocks = CHUNK_SIZE / BLOCK_SIZE;
for (var xx = 0; xx < _chunk_blocks; xx++) {
	for (var yy = 0; yy < _chunk_blocks; yy++) {
		var color = scGenerateColor(grid[# xx, yy]);
		scDrawRect(
			x + xx * BLOCK_SIZE, 
			y + yy * BLOCK_SIZE, 
			x + (xx + 1) * BLOCK_SIZE, 
			y + (yy + 1) * BLOCK_SIZE, 
			color, 
			false, 
			1);
	}
}
scDrawRect(x, y, x + CHUNK_SIZE, y + CHUNK_SIZE, c_red, true, 1);