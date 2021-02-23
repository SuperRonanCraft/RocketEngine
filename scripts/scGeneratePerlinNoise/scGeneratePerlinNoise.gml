///@arg x
///@arg y
///@arg max
///@arg min
///@arg seed
///@arg chunk_size
///@arg top?
function scGeneratePerlinNoise(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _x = argument0;
	var _y = argument1;
	var _max = argument2;
	var _min = argument3;
	var _seed = argument4;
	var _chunk_size = argument5;
	var _top = argument6; //Just top noise

	var noise = 0;

	_max = _max div 2;

	if (_top) {
		while(_chunk_size > 0) {
			var _index_x = _x div _chunk_size;
			//var _index_y = _y div _chunk_size;
	
			var t_x = (abs(_x) % _chunk_size) / _chunk_size;
			//var t_y = (abs(_y) % _chunk_size) / _chunk_size;
	
			if (sign(_x) == -1) {t_x = 1 - t_x; _index_x--;}
			//if (sign(_y) == -1) {t_y = 1 - t_y; _index_y--;}
	
			var r_0 = scGenerateSeed(_seed, _max, _index_x, _y);
			var r_1 = scGenerateSeed(_seed, _max, _index_x + 1, _y);
			//var r_10 = scGenerateSeed(_seed, _max, _index_x + 1, _index_y);
			//var r_11 = scGenerateSeed(_seed, _max, _index_x + 1, _index_y + 1);
	
			//var r_0 = lerp(r_00, r_01, t_y);
			//var r_1 = lerp(r_10, r_11, t_y);
	
			noise += lerp(r_0, r_1, t_x);
			_chunk_size = _chunk_size div 2;
			_max = _max div 2;
			_max = max(_min, _max);
		}
	} else {
		while(_chunk_size > 0) {
			var _index_x = _x div _chunk_size;
			var _index_y = _y div _chunk_size;
	
			var t_x = (abs(_x) % _chunk_size) / _chunk_size;
			var t_y = (abs(_y) % _chunk_size) / _chunk_size;
	
			if (sign(_x) == -1) {t_x = 1 - t_x; _index_x--;}
			if (sign(_y) == -1) {t_y = 1 - t_y; _index_y--;}
	
			var r_00 = scGenerateSeed(_seed, _max, _index_x, _y);
			var r_01 = scGenerateSeed(_seed, _max, _index_x + 1, _y);
			var r_10 = scGenerateSeed(_seed, _max, _index_x + 1, _index_y);
			var r_11 = scGenerateSeed(_seed, _max, _index_x + 1, _index_y + 1);
	
			var r_0 = lerp(r_00, r_01, t_y);
			var r_1 = lerp(r_10, r_11, t_y);
	
			noise += lerp(r_0, r_1, t_x);
			_chunk_size = _chunk_size div 2;
			_max = _max div 2;
			_max = max(_min, _max);
		}
	}

	return round(noise);


}
