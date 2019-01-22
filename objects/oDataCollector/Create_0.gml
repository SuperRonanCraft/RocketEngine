/// @description Make a text file


dataStr = "data.sav"; //File name

if (file_exists(dataStr)) { 

	ini_open(dataStr); //Open stream

	//STATS
	var sec = "Statistics";
	global.score_p1_wins = ini_read_real(sec, "p1_wins", global.score_p1_wins);
	global.score_p1_loses = ini_read_real(sec, "p1_loses", global.score_p1_loses);
	global.score_p2_wins = ini_read_real(sec, "p2_wins", global.score_p2_wins);
	global.score_p2_loses = ini_read_real(sec, "p2_loses", global.score_p2_loses);
	
	ini_close(); //Close stream
}

//OLD SYSTEM
file = file_text_open_write(working_directory + "data.txt");
file_text_write_string(file, "DATA COLLECTION");
file_text_writeln(file);
file_text_close(file);

games = 0;

timeToHit = ds_list_create();
timer = 0;
beginCount = false;
