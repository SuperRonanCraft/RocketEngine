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
			//Points
			var ary = [CACHE.GM_TARGETS_POINTS];
			for (var i = 0; i < array_length_1d(ary); i++) {
				var val = scCacheGetType(ary[i]);
				map[? val + mode] = ini_read_real(sec + mode, val, 0);
			}
			break;
		case GAMEMODE.SINGLE:
			//Level, checkpoint, lives, rocket
			var ary = [CACHE.GM_SINGLE_LEVEL, CACHE.GM_SINGLE_CHECKPOINT, 
				CACHE.GM_SINGLE_LIVES, CACHE.GM_SINGLE_ROCKET];
			for (var i = 0; i < array_length_1d(ary); i++) {
				var val = scCacheGetType(ary[i]);
				map[? val + mode] = ini_read_real(sec + mode, val, 0);
			}
			break;
		default:
			//P1 wins, P2 wins
			var ary = [CACHE.GM_GENERAL_P1_WINS, CACHE.GM_GENERAL_P2_WINS];
			for (var i = 0; i < array_length_1d(ary); i++) {
				var val = scCacheGetType(ary[i]);
				map[? val + mode] = ini_read_real(sec + mode, val, 0);
			}
			break;
	}
}

//GENERAL
//var val = scCacheGetType(CACHE.TIME_PLAYED); //TIME PLAYED
//map[? val + mode] = ini_read_real(sec + mode, val, 0);

ini_close(); //Close stream
