/// @desc clean chunk

for (var xx = 0; xx < chunk_size; xx++)
	for (var yy = 0; yy < chunk_size; yy++) {
		var _block_id = chunk_grid[# xx, yy];
		switch (_block_id) {
			case 0: //Wall block
				if (chunk_blocks[# xx, yy] != 0)
					with(chunk_blocks[# xx, yy])
						instance_destroy();
				break;
			default:
				break;
		}
	}
surface_free(chunk_surface);
ds_grid_destroy(chunk_blocks);