///@arg width
///@arg grid
///@arg seed
///@arg _chunk_size
function scGenerateLevel(argument0, argument1, argument2, argument3) {
	var _w = argument0;
	var _map = argument1;
	var _seed = argument2;
	var _chunk_size = argument3;

	for (var xx = 0; xx < _w; xx++) {
		var zz = scGeneratePerlinNoise(
			(x / BLOCK_SIZE) + xx, 
			0,
			70,
			1,
			_seed,
			_chunk_size,
			true);
		_map[? xx] = zz;
	}


}
