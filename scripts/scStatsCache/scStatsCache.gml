/// @desc save a value to the database and save it to cache
/// @arg type[...
/// @arg keys[...
/// @arg values[...

/*var gm = argument0;
var keys = argument1;
var values = argument2;*/

var type = argument[0];
var keys = argument[1];
var vals = argument[2];

//STATISTICS
var map = oDataCollector.data_cache;

switch (type) {
	case STATISTICS_TYPE.VALUE_GAMEMODE:
		var mode = argument[3];
		for (var i = 0; i < array_length_1d(keys); i++) { //Interate through each key
			var key = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, keys[i]);
			map[? key + mode] = vals[i]; //CACHE THE VALUE
		}
		break;
	case STATISTICS_TYPE.VALUE_GENERAL:
		for (var i = 0; i < array_length_1d(keys); i++) { //Interate through each key
			var key = scStatsGetType(STATISTICS_TYPE.SECTION_GENERAL, keys[i]);
			map[? key] = vals[i]; //CACHE THE VALUE
		}
		break;
	default: show_debug_message("ERROR"); break;
}