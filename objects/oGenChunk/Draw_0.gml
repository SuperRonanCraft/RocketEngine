/// @desc Draw stone & place blocks
if (chunk_grid != noone )
if (!surface_exists(chunk_surface)) {
	chunk_surface = surface_create(CHUNK_SIZE, room_height);
	surface_set_target(chunk_surface);
	draw_clear_alpha(c_black, 0);
	
	for (var xx = 0; xx < chunk_width; xx++) {
		var _h = round(chunk_grid[# xx, 0]);
		var dif = (room_height / BLOCK_SIZE) - _h;
		for (var i = 1; i < dif; i++) { //Draw fake walls after 3
			var color = scGenerateColor(chunk_grid[# xx, 0], i);
			scDrawRect(
				xx * BLOCK_SIZE, 
				(_h + i) * BLOCK_SIZE, 
				(xx + 1) * BLOCK_SIZE, 
				(_h + i + 1) * BLOCK_SIZE, 
				color, 
				false, 
				1);
		}
	}

	surface_reset_target();
} else
	draw_surface(chunk_surface, x, y);

if (global.debug)
	scDrawRect(x, y, x + CHUNK_SIZE, room_height, c_red, true, 1);