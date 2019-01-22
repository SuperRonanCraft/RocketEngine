with (oDataCollector) {

	ini_open(dataStr); //Open stream

	//STATISTICS
	var sec = "Statistics";
	ini_write_real(sec, "p1_wins", global.score_p1_wins);
	ini_write_real(sec, "p1_loses", global.score_p1_loses);
	ini_write_real(sec, "p2_wins", global.score_p2_wins);
	ini_write_real(sec, "p2_loses", global.score_p2_loses);

	ini_close(); //Close stream
}