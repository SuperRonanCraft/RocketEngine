/// @desc Generate our chunk after create event
if (chunk_generated) exit;
chunk_generated = true;

//Generate chunk
if (chunk_noise == noone || chunk_grid == noone) { //No cached chunks
	show_debug_message("Loading brand new chunk, id: " + string(chunk_id[0]) + " " + string(chunk_id[1]));
	chunk_noise = ds_map_create();
	scGenerateLevel(chunk_size, chunk_noise, oGenerationHandler.seed, oGenerationHandler.chunk_size);
	//Cave stuff...
	/*chunk_noise_2d = ds_grid_create(chunk_size, chunk_size);
	for (var xx = 0; xx < chunk_size; xx++)
		for (var yy = 0; yy < chunk_size; yy++)
			if (scGeneratePerlinNoise((x / BLOCK_SIZE) + xx, (y / BLOCK_SIZE) + yy, 100, 1, oGenerationHandler.seed, oGenerationHandler.chunk_size, false) < 50)
					chunk_noise_2d[# xx, yy] = 1; //Wall goes here
	repeat(7) {
		for (var xx = 0; xx < chunk_size - 1; xx++) {
			for (var yy = 0; yy < chunk_size - 1; yy++) {
				var adj_floor = 0, adj_wall = 0;
				//Check neighbors
				for (var xx2 = -1; xx2 <= 1; xx2++) {
					for (var yy2 = -1; yy2 <= 1; yy2++) {
						if (xx + xx2 > 0 && xx + xx2 < chunk_size && yy + yy2 > 0 && yy + yy2 < chunk_size) {
							if (chunk_noise_2d[# xx + xx2, yy + yy2] == 1 && chunk_noise_2d[# xx, yy] == 0) adj_floor++;
							if (chunk_noise_2d[# xx + xx2, yy + yy2] == 0 && chunk_noise_2d[# xx, yy] == 1) adj_wall++;
						}
					}
				}
				if (adj_floor >= 5)
					chunk_noise_2d[# xx, yy] = 1;
				if (adj_wall >= 5)
					chunk_noise_2d[# xx, yy] = 0;
			}
		}
	}*/
} else {
	show_debug_message("Loading chunk id: " + string(chunk_id[0]) + " " + string(chunk_id[0]) + ", from cache!");
	chunk_flatten = false; //Do not load, we are loading from our cache!
}
	
//Generate Blocks
event_user(0);

with (oGenerationHandler) {
	var _map = chunks_grid[# other.chunk_id[0], other.chunk_id[1]];
	_map[? CHUNK_MAP.LOADED] = true;
}