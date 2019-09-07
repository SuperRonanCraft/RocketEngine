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

ini_open(scFileGetType(FILES.DATABASE)); //Open stream

//STATISTICS
var map = oStatisticsHandler.stats_map;

switch (type) {
	case STATISTICS_TYPE.VALUE_GAMEMODE:
		var mode = argument[3];
		var sec = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, STATISTICS_GAMEMODE.SECTION);
		for (var i = 0; i < array_length_1d(keys); i++) { //Interate through each key
			var key = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, keys[i]);
			ini_write_real(sec + mode, key, vals[i]); //WRITE TO FILE
			map[? key + mode] = vals[i]; //CACHE THE VALUE
		}
		break;
	case STATISTICS_TYPE.VALUE_GENERAL:
		var sec = scStatsGetType(STATISTICS_TYPE.SECTION_GENERAL, STATISTICS_GENERAL.SECTION);
		for (var i = 0; i < array_length_1d(keys); i++) { //Interate through each key
			var key = scStatsGetType(STATISTICS_TYPE.SECTION_GENERAL, keys[i]);
			ini_write_real(sec, key, vals[i]); //WRITE TO FILE
			map[? key] = vals[i]; //CACHE THE VALUE
		}
		break;
	default: show_debug_message("ERROR"); break;
}

ini_close(); //Close stream