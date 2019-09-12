//Resets all unwanted saved stats at the beginning of a game
var map = oStatisticsHandler.stats_map;

for (var i = 0; i < STATISTICS_GENERAL.SECTION; i++) //Interate through each key
	if (!scStatsGetType(STATISTICS_TYPE.SAVE, i)) { //not wanting to be saved
		var key = scStatsGetType(STATISTICS_TYPE.SECTION_GENERAL, i);
		if (key != noone) {
			//if (ds_exists(map[? key], ds_type_map))
			//	ds_map_destroy(map[? key]);
			map[? key] = 0; //Set to default value
		}
	}