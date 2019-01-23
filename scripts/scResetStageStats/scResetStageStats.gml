//RESET STAGE STATS
ini_open(scFileGetType(FILES.DATABASE)); //Open stream

var sec = "Statistics." + string(global.gamemode) + ".Stage";
if (ini_read_real(sec, "stage", noone) != room) {
	ini_write_real(sec, "p1_wins", 0);
	ini_write_real(sec, "p2_wins", 0);
	ini_write_real(sec, "stage", room);
	show_debug_message("RESETTING STAGE DATA!");
}

ini_close(); //Close stream