///@desc Collect outcome data

oDataCollector.beginCount = false;

scAddData(string(DATATYPE.WINNER) + ":" + (!tie ? string(global.winner) : string(DATATYPE_RESULT.TIE)));
scData_CalculateAvgHit();
scAddData(string(DATATYPE.TIME) + ":" + string(timer_current));
scAddData(string(DATATYPE.TIME_LENGTH) + ":" + string(timer));
//Check if game ended in timeout, add to data
scAddData(string(DATATYPE.TIMEOUT) + ":" + string(timer_current <= 0));

//WINNER / LOSER
if (global.winner == TEAM.LEFT) {
	global.score_p1_wins++;
	global.score_p2_loses++;
} else if (global.winner == TEAM.RIGHT) {
	global.score_p2_wins++;
	global.score_p1_loses++;
}

scSaveStats(); //Save the stats to the file