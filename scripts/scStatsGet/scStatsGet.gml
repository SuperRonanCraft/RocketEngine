/// @arg gamemode
/// @arg player

var gm = argument0;
var ply = argument1;
var map = oDataCollector.data_cache;
var mode = string(gm);
var val = noone;
switch (gm) {
	case GAMEMODE.TARGETS:
		val = map[? scCacheGetType(CACHE.GM_TARGETS_POINTS) + mode]; break;
	default: 
		var val = ply == 1 ? scCacheGetType(CACHE.GM_GENERAL_P1_WINS) : scCacheGetType(CACHE.GM_GENERAL_P2_WINS)
		val = map[? val + mode]; break;
}

return val;