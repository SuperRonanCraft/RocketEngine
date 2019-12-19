/// @desc 
randomize();
//chunks_grid = ds_grid_create(128, 128);
chunks_max = 128; //Max chunk limit
chunks_grid = ds_grid_create(chunks_max, chunks_max); //Grid of maps
chunk_size = irandom_range(1, 20) * BLOCK_SIZE; //Not the CHUNK_SIZE, but a noise size
seed = round(random_range(1000000, 10000000));

#macro BLOCK_SIZE 32
#macro CHUNK_SIZE (32 * 16)

show_debug_message("--------------");
show_debug_message("Generating Level!");
show_debug_message("Chunk size: " + string(chunk_size));
show_debug_message("Creating Chunks...");
var _x_start = oPlayer.x div CHUNK_SIZE;
var _y_start = oPlayer.y div CHUNK_SIZE;
for (var xx = _x_start - 1; xx <= _x_start + 1; xx++) {
	for (var yy = _y_start - 1; yy <= _y_start + 1; yy++) {
		if (xx >= 0 && yy >= 0 && xx < chunks_max && yy < chunks_max) {
			var _chunk = instance_create_depth(xx * CHUNK_SIZE, yy * CHUNK_SIZE, depth, oGenChunk);
			var _chunk_map = ds_map_create();
			//_chunk_map[? CHUNK_MAP.ID] = [xx, yy];
			_chunk_map[? CHUNK_MAP.OBJECT] = _chunk;
			_chunk_map[? CHUNK_MAP.NOISE] = noone;
			_chunk_map[? CHUNK_MAP.LOADED] = false;
			_chunk.chunk_id = [xx, yy];
			_chunk.chunk_force_load = true;
			ds_grid_add(chunks_grid, xx, yy, _chunk_map);
			show_debug_message("Chunk created ID: " + string(xx) + ", " + string(yy));
		}
	}
}

alarm[0] = room_speed; //Auto load chunks

enum CHUNK_MAP {
	OBJECT, NOISE, LOADED
}