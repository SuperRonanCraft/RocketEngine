/// @desc 
randomize();
chunks_grid = ds_grid_create(room_width / CHUNK_SIZE, 1);
chunk_size = 1//irandom_range(1, 20) * BLOCK_SIZE;
seed = round(random_range(1000000, 10000000));

#macro BLOCK_SIZE 32
#macro CHUNK_SIZE 512

for (var xx = 0; xx < room_width div CHUNK_SIZE; xx++) {
	var _chunk = instance_create_depth(xx * CHUNK_SIZE, 0, depth, oGenChunk);
	var _chunk_map = ds_map_create();
	_chunk_map[? "id"] = xx;
	_chunk_map[? "obj"] = _chunk;
	_chunk.chunk_id = xx;
	chunks_grid[# xx, 0] = _chunk_map;
}

/*x = 0;
y = room_height - TILE_SIZE;