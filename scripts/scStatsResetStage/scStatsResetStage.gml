/// @arg force

//RESET STAGE STATS
ini_open(scFileGetType(FILES.DATABASE)); //Open stream

var sec = "Statistics." + string(global.gamemode) + ".Stage";
if (ini_read_real(sec, "stage", noone) != room || argument0) {
	ini_write_real(sec, scCacheGetType(CACHE.GM_GENERAL_P1_WINS), 0);
	ini_write_real(sec, scCacheGetType(CACHE.GM_GENERAL_P2_WINS), 0);
	ini_write_real(sec, "stage", room);
}

ini_close(); //Close stream