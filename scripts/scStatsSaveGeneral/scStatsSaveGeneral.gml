/// @desc save all stats

ini_open(scFileGetType(FILES.DATABASE)); //Open stream

//STATISTICS

var map = oStatisticsHandler.stats_map;

var sec = scStatsGetType(STATISTICS_TYPE.SECTION_GENERAL, STATISTICS_GENERAL.SECTION);
for (var i = 0; i < STATISTICS_GENERAL.SECTION; i++) { //Interate through each key
	if (scStatsGetType(STATISTICS_TYPE.SAVE, i)) {
		var key = scStatsGetType(STATISTICS_TYPE.SECTION_GENERAL, i);
		if (key != noone) {
			var val = map[? key]; //GRAB THE VALUE
			ini_write_real(sec, key, val); //WRITE TO FILE
		}
	}
}

ini_close(); //Close stream