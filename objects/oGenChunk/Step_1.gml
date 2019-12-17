/// @desc Generate our chunk after create event
if (chunk_generated) exit;
chunk_generated = true;

//Generate chunk
if (chunk_grid == noone) { //No cached chunks
	show_debug_message("Loading brand new chunk, id: " + string(chunk_id));
	chunk_grid = ds_grid_create(chunk_width, 1)
	scGenerateLevel(chunk_width, chunk_grid, oGenerationHandler.seed, oGenerationHandler.chunk_size);
} else {
	show_debug_message("Loading chunk id: " + string(chunk_id) + ", from cache!");
	chunk_flatten = false; //Do not load, we are loading from our cache!
}
	
//Generate Blocks
event_user(0);

with (oGenerationHandler) {
	var _map = chunks_map[? other.chunk_id];
	_map[? CHUNK_MAP.LOADED] = true;
}