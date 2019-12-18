/// @desc Check to despawn
with (pEntity) {
	if (abs((other.chunk_id) - (x div CHUNK_SIZE)) > 2) //Farther than 2 chunks away
		with (other)
			event_user(1); //Unload
	else
		other.alarm[0] = room_speed;
}

//Disable and/or enable walls in view
/*with (oCamera) {
	var _buffer = 64;
	var _xx = x - RES_W / 2;
	var _yy = y - RES_H / 2;
	with (other) {
		for (var xx = 0; xx < chunk_width; xx++) {
			var _h = round(chunk_grid[# xx, 0]);
			var dif = (room_height / BLOCK_SIZE) - _h;
			for (var i = 0; i < dif; i++) {
				if (x < _xx || x > _xx + RES_W + _buffer * 2)
					instance_destroy();
				else if (y < _yy || y > _yy + RES_H + _buffer * 2)
					instance_destroy();
			}
		}
	}
}