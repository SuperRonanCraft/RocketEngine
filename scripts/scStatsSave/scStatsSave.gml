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
		ini_write_real(sec, "points", scr[0]);
		map[? "points_" + mode] = scr[0];
		break;
	default:
	// GAMEMODE
		ini_write_real(sec, "p1_wins", scr[0]);
		ini_write_real(sec, "p2_wins", scr[1]);
	// STAGE
		sec = sec + ".Stage";
		ini_write_real(sec, "p1_wins", scr[2]);
		ini_write_real(sec, "p2_wins", scr[3]);
	//CACHE
		map[? "p1_wins_" + mode] = scr[0];
		map[? "p2_wins_" + mode] = scr[1];
		break;
}
ini_close(); //Close stream