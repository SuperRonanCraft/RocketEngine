/// @desc Generate Blocks
event_user(2); //Flatten terrain
for (var i = 0; i < ds_list_size(chunk_walls); i++)
	with(chunk_walls[| i])
		instance_destroy();
if (surface_exists(chunk_surface))
	surface_free(chunk_surface);
/*var _w = CHUNK_SIZE / BLOCK_SIZE;

for (var xx = 0; xx < _w; xx++) {
	var _h = round(grid[# xx, 0]) * BLOCK_SIZE;
	var dif = ((room_height - y) / BLOCK_SIZE) - _h;
	for (var i = 0; i < dif; i++) {
		var wall = instance_create_depth(x + xx * BLOCK_SIZE, yy, depth, oWall);
		wall.color = scGenerateColor(grid[# xx, 0] + irandom(50), i);
		wall.alpha = grid[# xx, 0] / 100;
	}
}*/