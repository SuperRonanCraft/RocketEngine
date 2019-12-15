var _w = CHUNK_SIZE / BLOCK_SIZE;
grid = ds_grid_create(_w, 1);

scGenerateLevel(_w, grid, oGenerationHandler.seed, oGenerationHandler.chunk_size);
chunk_id = noone; //My Chunk ID

//chunk_surface = noone;
//alarm[0] = room_speed;

for (var xx = 0; xx < _w; xx++) {
	var _h = round(grid[# xx, 0]);
	var wall = instance_create_depth(x + xx * BLOCK_SIZE, _h * BLOCK_SIZE, depth, oWall);
	wall.color = scGenerateColor(grid[# xx, 0]);
	wall.alpha = grid[# xx, 0] / 100;
	var dif = (room_height - y) / BLOCK_SIZE;
	wall.image_yscale = dif;
}

//ds_map_add(global.chunk_map, id, 1);