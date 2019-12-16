/// @desc Unload Chunk
show_debug_message("- Unloading chunk ID: " + string(chunk_id) + "...");
with (oGenerationHandler) {
	var _map = chunks_map[? other.chunk_id];
	ds_map_destroy(_map);
	ds_map_delete(chunks_map, other.chunk_id);
}
show_debug_message("+ Unloaded chunk ID: " + string(chunk_id));
instance_destroy();