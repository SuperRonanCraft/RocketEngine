///@arg width
///@arg grid
///@arg seed
///@arg _chunk_size
var _w = argument0;
var _grid = argument1;
var _seed = argument2;
var _chunk_size = argument3;

show_debug_message("Generating Level!");

show_debug_message("Chunk size: " + string(_chunk_size));

for (var xx = 0; xx < _w; xx++) {
	var zz = scGeneratePerlinNoise(
		(x / BLOCK_SIZE) + xx, 
		0,
		100,
		1,
		_seed,
		_chunk_size);
	_grid[# xx, 0] = zz;
}