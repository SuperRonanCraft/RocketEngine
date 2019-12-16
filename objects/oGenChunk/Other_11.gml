/// @desc Unload Chunk
with (oGenerationHandler) {
	var _map = chunks_map[? other.chunk_id];
	ds_map_destroy(_map);
	ds_map_delete(chunks_map, other.chunk_id);
}
instance_destroy();
show_debug_message("- Unloaded chunk ID: " + string(chunk_id));