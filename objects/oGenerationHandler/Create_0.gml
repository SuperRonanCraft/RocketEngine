/// @desc 
randomize();
chunks_map = ds_map_create(); //Map of maps
chunk_size = irandom_range(2, 20) * BLOCK_SIZE; //Not the CHUNK_SIZE, but a noise size
seed = round(random_range(1000000, 10000000));

#macro BLOCK_SIZE 32
#macro CHUNK_SIZE (32 * 32)

show_debug_message("--------------");
show_debug_message("Generating Level!");
show_debug_message("Chunk size: " + string(chunk_size));
show_debug_message("Creating " + string(room_width div CHUNK_SIZE) + " Chunks" );
for (var xx = 0; xx < room_width div CHUNK_SIZE; xx++) {
	var _chunk = instance_create_depth(xx * CHUNK_SIZE, 0, depth, oGenChunk);
	var _chunk_map = ds_map_create();
	_chunk_map[? CHUNK_MAP.ID] = xx;
	_chunk_map[? CHUNK_MAP.OBJECT] = _chunk;
	_chunk_map[? CHUNK_MAP.GRID] = noone;
	_chunk_map[? CHUNK_MAP.LOADED] = false;
	_chunk.chunk_id = xx;
	ds_map_add(chunks_map, xx, _chunk_map);
	show_debug_message("Chunk created ID: " + string(xx));
}

alarm[0] = room_speed; //Auto load chunks

enum CHUNK_MAP {
	ID, OBJECT, GRID, LOADED
}