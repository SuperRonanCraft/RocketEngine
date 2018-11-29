///@desc Collect outcome data

oDataCollector.beginCount = false;

scAddData("OUTCOME:");

scData_CalculateAvgHit();

if(!tie)
	scAddData("WINNER: " + string(global.winner));
else
	scAddData("TIE");	
//Check if game ended in timeout, add to data
scAddData("TIMEOUT: " + string(timer_current <= 0));