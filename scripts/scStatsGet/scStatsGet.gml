/// @arg gamemode
/// @arg player

var gm = argument0;
var ply = string(argument1);
var map = oDataCollector.data_cache;
var mode = string(gm);
var val = noone;
switch (gm) {
	case GAMEMODE.TARGETS:
		val = map[? "points_" + mode]; break;
	default: 
		val = map[? "p" + ply + "_wins_" + mode]; break;
}

return val;