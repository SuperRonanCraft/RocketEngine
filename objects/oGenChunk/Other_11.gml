/// @desc Unload Chunk
with (oGenerationHandler) {
	var _map = chunks_grid[# other.chunk_id[0], other.chunk_id[1]];
	_map[? CHUNK_MAP.LOADED] = false;
	_map[? CHUNK_MAP.NOISE] = ds_map_create();
	ds_map_copy(_map[? CHUNK_MAP.NOISE], other.chunk_noise);
	ds_map_destroy(other.chunk_noise);
	//ds_map_destroy(_map);
	//ds_map_delete(chunks_map, other.chunk_id);
}
instance_destroy();
show_debug_message("- Unloaded chunk ID: " + string(chunk_id));