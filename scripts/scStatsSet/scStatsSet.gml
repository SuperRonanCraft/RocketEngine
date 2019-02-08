/// @desc save a value to the database and save it to cache
/// @arg gamemode
/// @arg cache-values[...
/// @arg values[...

var gm = argument0;
var keys = argument1;
var values = argument2;

ini_open(scFileGetType(FILES.DATABASE)); //Open stream

//STATISTICS
var map = oDataCollector.data_cache;
var mode = string(gm);
var sec = scCacheGetType(CACHE.SECTION);

for (var i = 0; i < array_length_1d(keys); i++) { //Interate through each key
	var key = scCacheGetType(keys[i]);
	ini_write_real(sec + mode, key, values[i]); //WRITE TO FILE
	map[? key + mode] = values[i]; //CACHE THE VALUE
}

ini_close(); //Close stream