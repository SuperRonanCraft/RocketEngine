ini_open(scFileGetType(FILES.DATABASE)); //Open stream

//STATISTICS
// GAMEMODE
var sec = "Statistics." + string(global.gamemode);
ini_write_real(sec, "p1_wins", global.score_mode_p1_wins);
ini_write_real(sec, "p2_wins", global.score_mode_p2_wins);


// STAGE
sec = sec + ".Stage";
ini_write_real(sec, "p1_wins", global.score_stage_p1_wins);
ini_write_real(sec, "p2_wins", global.score_stage_p2_wins);

var map = oDataCollector.data_cache;
var mode = string(global.gamemode);
map[? "p1_wins_" + mode] = global.score_mode_p1_wins;
map[? "p2_wins_" + mode] = global.score_mode_p2_wins;

ini_close(); //Close stream