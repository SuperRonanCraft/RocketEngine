/// @desc Spawn/Despawn blocks

//Disable and/or enable walls in view
with (oCamera) {
	var _buffer = 64;
	var _xx = x - RES_W / 2;
	var _yy = y - RES_H / 2;
	with (other) {
		for (var xx = 0; xx < chunk_size; xx++) {
			//var _h = round(chunk_noise[? xx]);
			//var dif = (room_height / BLOCK_SIZE) - _h;
			for (var yy = 0; yy < chunk_size; yy++) {
				var _block_id = chunk_grid[# xx, yy];
				var _bx = (xx * BLOCK_SIZE) + x;
				var _by = (yy * BLOCK_SIZE) + y;
				switch (_block_id) {
					case 0:
						if (chunk_blocks[# xx, yy] != 0) { //Despawn block
							if (	(_bx < _xx - _buffer || _bx > _xx + RES_W + _buffer) ||
									(_by < _yy - _buffer || _by > _yy + RES_H + _buffer)) {
										instance_destroy(chunk_blocks[# xx, yy]);
										chunk_blocks[# xx, yy] = 0;
								}
						} else { //Wall already despawned, spawn it back in
							if (	(_bx > _xx - _buffer && _bx < _xx + RES_W + _buffer) &&
									(_by > _yy - _buffer && _by < _yy + RES_H + _buffer)) {
										var wall = instance_create_depth(x + xx * BLOCK_SIZE, y + yy * BLOCK_SIZE, depth - 1, oWall);
										wall.visible = false;
										chunk_blocks[# xx, yy] = wall;
								}
						}
						break;
					default:
						break;
				}
			}
		}
	}
}