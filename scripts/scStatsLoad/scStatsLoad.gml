ini_open(scFileGetType(FILES.DATABASE)); //Open stream

//STATISTICS
var sec = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, STATISTICS_GAMEMODE.SECTION);

var map = oStatisticsHandler.stats_map;

//GAMEMODES
for (var i = 0; i < GAMEMODE.LENGTH; i++) {
	var gm = i;
	var mode = string(gm);
	switch (gm) {
		case GAMEMODE.TARGETS:
			//Points
			var ary = [STATISTICS_GAMEMODE.GM_TARGETS_POINTS];
			for (var i = 0; i < array_length_1d(ary); i++) {
				var val = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, ary[i]);
				map[? val + mode] = ini_read_real(sec + mode, val, 0);
				show_debug_message(string(val + mode));
				show_debug_message(map[? val + mode]);
			}
			break;
		case GAMEMODE.SINGLE:
			//Level, checkpoint, lives, rocket
			var ary = [STATISTICS_GAMEMODE.GM_SINGLE_LEVEL, STATISTICS_GAMEMODE.GM_SINGLE_CHECKPOINT, 
				STATISTICS_GAMEMODE.GM_SINGLE_LIVES, STATISTICS_GAMEMODE.GM_SINGLE_ROCKET];
			for (var i = 0; i < array_length_1d(ary); i++) {
				var val = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, ary[i]);
				map[? val + mode] = ini_read_real(sec + mode, val, 0);
			}
			break;
		case GAMEMODE.ONEVONE:
			//P1 wins, P2 wins
			var ary = [STATISTICS_GAMEMODE.GM_GENERAL_P1_WINS, STATISTICS_GAMEMODE.GM_GENERAL_P2_WINS];
			for (var i = 0; i < array_length_1d(ary); i++) {
				var val = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, ary[i]);
				map[? val + mode] = ini_read_real(sec + mode, val, 0);
			}
			break;
		default:
			break;
	}
}

//GENERAL
//var val = scCacheGetType(CACHE.TIME_PLAYED); //TIME PLAYED
//map[? val + mode] = ini_read_real(sec + mode, val, 0);
sec = scStatsGetType(STATISTICS_TYPE.SECTION_GENERAL, STATISTICS_GENERAL.SECTION);
//show_debug_message("LOADING GENERAL STATS...");
for (var i = 0; i < STATISTICS_GENERAL.SECTION; i++) {
	var key = scStatsGetType(STATISTICS_TYPE.SECTION_GENERAL, i);
	if (key != noone)
		map[? key] = ini_read_real(sec, key, false);
	//show_debug_message("-Sec: " + sec + " -Key: " + string(key) + " -Val: " + string(map[? key]));
}

ini_close(); //Close stream