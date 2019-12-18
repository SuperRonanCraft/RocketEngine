/// @desc Generate Blocks
event_user(2); //Flatten terrain
for (var i = 0; i < ds_list_size(chunk_walls); i++)
	with(chunk_walls[| i])
		instance_destroy();
if (surface_exists(chunk_surface))
	surface_free(chunk_surface);

//Generate walls
for (var xx = 0; xx < chunk_width; xx++) {
	var _h = round(chunk_grid[# xx, 0]);
	var dif = (room_height / BLOCK_SIZE) - _h;
	for (var i = 0; i < dif; i++) {
		var wall = instance_create_depth(x + xx * BLOCK_SIZE, (i + _h) * BLOCK_SIZE, depth - 1, oWall);
		//wall.color = scGenerateColor(chunk_grid[# xx, 0], i);
		//wall.chunk_id = chunk_id;
		//wall.visible = false;
		ds_list_add(chunk_walls, wall);
	}
	/*for (var i = 0; i < 3 && i < dif; i++) { //CREATE WALLS ONLY ON TOP LAYER
		var wall = instance_create_depth(x + xx * BLOCK_SIZE, (_h + i) * BLOCK_SIZE, depth - 1, oWall);
		wall.color = scGenerateColor(chunk_grid[# xx, 0] + irandom_range(-50, 50), i);
		ds_list_add(chunk_walls, wall);
	}*/
}

/*for (var i = 0; i < ds_list_size(chunk_walls); i++)
	if (instance_exists(chunk_walls[| i]))
		with(chunk_walls[| i])
			scMergeWall(id);

var walls_remove = ds_list_create();
for (var i = 0; i < ds_list_size(chunk_walls); i++)
	if (!instance_exists(chunk_walls[| i]))
		ds_list_add(walls_remove, chunk_walls[| i]);
	
for (var i = 0; i < ds_list_size(walls_remove); i++)
	ds_list_delete(chunk_walls, ds_list_find_index(chunk_walls, walls_remove[| i]));

ds_list_destroy(walls_remove);



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