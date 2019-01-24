/// @arg gamemode
/// @arg scores[...

var gm = argument0;
var scr = argument1;

ini_open(scFileGetType(FILES.DATABASE)); //Open stream

//STATISTICS

var map = oDataCollector.data_cache;
var mode = string(gm);
var sec = "Statistics." + mode;
switch (gm) {
	case GAMEMODE.TARGETS: //TARGETS GAMEMODE
	//GAMEMODE
		var val = scCacheGetType(CACHE.GM_TARGETS_POINTS); //POINTS
		ini_write_real(sec, val, scr[0]);
	//CACHE
		map[? val + mode] = scr[0];
		break;
	default:
	// GAMEMODE
		var valp1 = scCacheGetType(CACHE.GM_GENERAL_P1_WINS); //P1 GAMEMODE WINS
		var valp2 = scCacheGetType(CACHE.GM_GENERAL_P2_WINS); //P2 GAMEMODE WINS
		ini_write_real(sec, valp1, scr[0]);
		ini_write_real(sec, valp2, scr[1]);
	// STAGE
		sec = sec + ".Stage";
		ini_write_real(sec, valp1, scr[2]);
		ini_write_real(sec, valp2, scr[3]);
	//CACHE
		map[? valp1 + mode] = scr[0];
		map[? valp2 + mode] = scr[1];
		break;
}
ini_close(); //Close stream