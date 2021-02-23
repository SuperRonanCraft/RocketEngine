/// @arg gamemode
/// @arg scores[...
function scStatsSaveGamemode(argument0, argument1) {

	var gm = argument0;
	var scr = argument1;

	ini_open(scFileGetType(FILES.DATABASE)); //Open stream

	//STATISTICS

	var map = oStatisticsHandler.stats_map;
	var mode = string(gm);
	var sec = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, STATISTICS_GAMEMODE.SECTION) + mode;
	switch (gm) {
		case GAMEMODE.TARGETS: //TARGETS GAMEMODE
		//GAMEMODE
			var val = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, STATISTICS_GAMEMODE.GM_TARGETS_POINTS); //POINTS
			ini_write_real(sec, val, scr[0]);
		//CACHE
			map[? val + mode] = scr[0];
			break;
		case GAMEMODE.SINGLE: //TARGETS GAMEMODE
		//GAMEMODE
			var val = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, STATISTICS_GAMEMODE.GM_SINGLE_LEVEL); //LEVEL
			ini_write_real(sec, val, scr[0]);
			map[? val + mode] = scr[0]; //CACHE
			val = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, STATISTICS_GAMEMODE.GM_SINGLE_CHECKPOINT); //CHECKPOINT
			ini_write_real(sec, val, scr[1]);
			map[? val + mode] = scr[1]; //CACHE
			val = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, STATISTICS_GAMEMODE.GM_SINGLE_LIVES); //LIVES
			ini_write_real(sec, val, scr[2]);
			map[? val + mode] = scr[2]; //CACHE
			break;
		default:
		// GAMEMODE
			var valp1 = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, STATISTICS_GAMEMODE.GM_GENERAL_P1_WINS); //P1 GAMEMODE WINS
			var valp2 = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, STATISTICS_GAMEMODE.GM_GENERAL_P2_WINS); //P2 GAMEMODE WINS
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

	//GENERAL


	ini_close(); //Close stream


}
