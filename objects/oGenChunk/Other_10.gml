/// @desc Generate Blocks
event_user(2); //Flatten terrain

//Clear up any walls/surface we have hangin around
/*for (var i = 0; i < ds_list_size(chunk_walls); i++)
	with(chunk_walls[| i])
		instance_destroy();*/
if (surface_exists(chunk_surface))
	surface_free(chunk_surface);

//Populate grid chunk with air or walls
chunk_grid = ds_grid_create(chunk_size, chunk_size);
ds_grid_set_region(chunk_grid, 0, 0, chunk_size - 1, chunk_size - 1, -1);
for (var xx = 0; xx < chunk_size; xx++)
	for (var yy = 0; yy < chunk_size; yy++) {
		var _h = round(chunk_noise[? xx]);
		if (_h <= yy + (chunk_id[1] * chunk_size))
			chunk_grid[# xx, yy] = 0; //Make this a wall
	}
//Generate walls
if (chunk_force_load) {
	for (var xx = 0; xx < chunk_size; xx++)
		for (var yy = 0; yy < chunk_size; yy++) {
			var _block_id = chunk_grid[# xx, yy];
			switch (_block_id) {
				case 0: //WALL
					var wall = instance_create_depth(x + xx * BLOCK_SIZE, y + yy * BLOCK_SIZE, depth - 1, oWall);
					//wall.color = scGenerateColor(chunk_grid[# xx, 0], i);
					//wall.chunk_id = chunk_id;
					wall.visible = false;
					ds_grid_set(chunk_blocks, xx, yy, wall);
					break;
				default: //AIR
					break;
			}
		}
	chunk_force_load = false;
	//event_user(3);
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