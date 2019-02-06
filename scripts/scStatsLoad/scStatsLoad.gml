ini_open(scFileGetType(FILES.DATABASE)); //Open stream

//STATISTICS
var sec = scCacheGetType(CACHE.SECTION);

var map = oDataCollector.data_cache;

//GAMEMODES
for (var i = 0; i < GAMEMODE.LENGTH; i++) {
	var gm = i;
	var mode = string(gm);
	switch (gm) {
		case GAMEMODE.TARGETS:
			var val = scCacheGetType(CACHE.GM_TARGETS_POINTS); //POINTS
			map[? val + mode] = ini_read_real(sec + mode, val, 0); break;
		case GAMEMODE.SINGLE:
			var val = scCacheGetType(CACHE.GM_SINGLE_LEVEL); //LEVEL
			map[? val + mode] = ini_read_real(sec + mode, val, 0);
			val = scCacheGetType(CACHE.GM_SINGLE_CHECKPOINT); //CHECKPOINT
			map[? val + mode] = ini_read_real(sec + mode, val, 0);
			val = scCacheGetType(CACHE.GM_SINGLE_LIVES); //LIVES
			map[? val + mode] = ini_read_real(sec + mode, val, 0);
			break;
		default:
			var val = scCacheGetType(CACHE.GM_GENERAL_P1_WINS); //P1 WINS GM
			map[? val + mode] = ini_read_real(sec + mode, val, 0);
			val = scCacheGetType(CACHE.GM_GENERAL_P2_WINS); //P2 WINS GM
			map[? val + mode] = ini_read_real(sec + mode, val, 0);
			break;
	}
}

//GENERAL
//var val = scCacheGetType(CACHE.TIME_PLAYED); //TIME PLAYED
//map[? val + mode] = ini_read_real(sec + mode, val, 0);

ini_close(); //Close stream
