ini_open(scFileGetType(FILES.DATABASE)); //Open stream

//STATISTICS
// GAMEMODE
var sec = "Statistics." + string(global.gamemode);
global.score_mode_p1_wins = ini_read_real(sec, "p1_wins", 0);
global.score_mode_p2_wins = ini_read_real(sec, "p2_wins", 0);

// STAGE
sec = sec + ".Stage";
global.score_stage_p1_wins = ini_read_real(sec, "p1_wins", 0);
global.score_stage_p2_wins = ini_read_real(sec, "p2_wins", 0);

ini_close(); //Close stream