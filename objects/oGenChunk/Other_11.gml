/// @desc Unload Chunk
with (oGenerationHandler) {
	var _map = chunks_map[? other.chunk_id];
	_map[? CHUNK_MAP.LOADED] = false;
	_map[? CHUNK_MAP.GRID] = ds_grid_create(ds_grid_width(other.chunk_grid), ds_grid_height(other.chunk_grid));
	ds_grid_copy(_map[? CHUNK_MAP.GRID], other.chunk_grid);
	ds_grid_destroy(other.chunk_grid);
	//ds_map_destroy(_map);
	//ds_map_delete(chunks_map, other.chunk_id);
}
instance_destroy();
show_debug_message("- Unloaded chunk ID: " + string(chunk_id));