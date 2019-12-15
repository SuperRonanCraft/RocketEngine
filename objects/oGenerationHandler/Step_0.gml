/// @desc 
/*while(!generation_finished) {
	for (var j = 0; j < 40; j++) {
		for (var i = 0; i < room_width / TILE_SIZE; i++) {
			if (irandom_range(0, 2) == 1) {
				instance_create_depth(x, y, depth, oWall);
			}
			x += TILE_SIZE;
		}
		y -= TILE_SIZE;
		x = 0;
	}
	generation_finished = true;
}