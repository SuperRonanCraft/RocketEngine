/// @desc Generate our chunk after create event
if (chunk_generated) exit;
chunk_generated = true;

//Generate chunk
if (chunk_noise == noone || chunk_grid == noone) { //No cached chunks
	show_debug_message("Loading brand new chunk, id: " + string(chunk_id[0]) + " " + string(chunk_id[1]));
	chunk_noise = ds_map_create();
	scGenerateLevel(chunk_size, chunk_noise, oGenerationHandler.seed, oGenerationHandler.chunk_size);
} else {
	show_debug_message("Loading chunk id: " + string(chunk_id[0]) + " " + string(chunk_id[0]) + ", from cache!");
	chunk_flatten = false; //Do not load, we are loading from our cache!
}
	
//Generate Blocks
event_user(0);

with (oGenerationHandler) {
	var _map = chunks_grid[# other.chunk_id[0], other.chunk_id[1]];
	_map[? CHUNK_MAP.LOADED] = true;
}