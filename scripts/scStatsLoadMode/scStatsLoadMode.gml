function scStatsLoadMode() {
	ini_open(scFileGetType(FILES.DATABASE)); //Open stream

	//STATISTICS
	// GAMEMODE
	var sec = "Statistics." + string(global.gamemode);
	var valp1 = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, STATISTICS_GAMEMODE.GM_GENERAL_P1_WINS); //P1 GAMEMODE WINS
	var valp2 = scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, STATISTICS_GAMEMODE.GM_GENERAL_P2_WINS); //P2 GAMEMODE WINS
	global.score_mode_p1_wins = ini_read_real(sec, valp1, 0);
	global.score_mode_p2_wins = ini_read_real(sec, valp2, 0);

	// STAGE
	sec = sec + ".Stage";
	global.score_stage_p1_wins = ini_read_real(sec, valp1, 0);
	global.score_stage_p2_wins = ini_read_real(sec, valp2, 0);

	ini_close(); //Close stream


}
