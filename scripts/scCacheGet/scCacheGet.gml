/// @arg gamemode
/// @arg cache-value

var mode = string(argument0);
var sec = scCacheGetType(argument1);

return oDataCollector.data_cache[? sec + mode];