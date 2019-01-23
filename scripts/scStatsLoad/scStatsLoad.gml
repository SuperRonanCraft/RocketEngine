ini_open(scFileGetType(FILES.DATABASE)); //Open stream

//STATISTICS
var sec = "Statistics.";

var map = oDataCollector.data_cache;
for (var i = 0; i < GAMEMODE.LENGTH; i++) {
	var gm = i;
	var mode = string(gm);
	switch (gm) {
		case GAMEMODE.TARGETS:
			map[? "points_" + mode] = ini_read_real(sec + mode, "points", 0); break;
		default:
			map[? "p1_wins_" + mode] = ini_read_real(sec + mode, "p1_wins", 0);
			map[? "p2_wins_" + mode] = ini_read_real(sec + mode, "p2_wins", 0);
			break;
	}
}

ini_close(); //Close stream