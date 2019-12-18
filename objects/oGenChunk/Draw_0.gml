/// @desc Draw stone & place blocks
if (chunk_noise != noone && chunk_grid != noone)
if (!surface_exists(chunk_surface)) {
	chunk_surface = surface_create(CHUNK_SIZE, room_height);
	surface_set_target(chunk_surface);
	draw_clear_alpha(c_black, 0);
	
	for (var xx = 0; xx < chunk_size; xx++) {
		for (var yy = 0; yy < chunk_size; yy++) {
			//var _h = round(chunk_noise[? xx]);
			//var dif = (room_height / BLOCK_SIZE) - _h;
			var _block_id = chunk_grid[# xx, yy];
			switch (_block_id) {
				case 0: //Wall block
					var color = scGenerateColor(chunk_noise[? xx], yy + (chunk_id[1] * chunk_size));
					scDrawRect(
						xx * BLOCK_SIZE, 
						yy * BLOCK_SIZE, 
						(xx + 1) * BLOCK_SIZE, 
						(yy + 1) * BLOCK_SIZE, 
						color, 
						false, 
						1);
					break;
				default: //Air
					break;
			}
		}
	}

	surface_reset_target();
} else
	draw_surface(chunk_surface, x, y);

if (global.debug)
	scDrawRect(x, y, x + CHUNK_SIZE, y + CHUNK_SIZE, c_red, true, 1);