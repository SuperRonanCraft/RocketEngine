//Reset all stats

ini_open(scFileGetType(FILES.DATABASE)); //Open stream

//STATISTICS
var sec = "Statistics.";
for (var i = 0; i < GAMEMODE.LENGTH; i++) {
	// GAMEMODE
	var mode = string(i);
	var newSec = sec + mode
	ini_write_real(newSec, "p1_wins", 0);
	ini_write_real(newSec, "p2_wins", 0);
	
	// STAGE
	newSec = newSec + ".Stage";
	ini_write_real(newSec, "p1_wins", 0);
	ini_write_real(newSec, "p2_wins", 0);
}


ini_close(); //Close stream

scLoadStats();