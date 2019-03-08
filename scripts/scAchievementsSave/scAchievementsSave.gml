/// @arg achivements[...
/// @arg values[...

var types = argument0;
var vals = argument1;

ini_open(scFileGetType(FILES.ACHIEVEMENTS)); //Open stream

//ACHIEVEMENTS
var sec = scAchievementGetType(ACHIEVEMENT_TYPE.SECTION, ACHIEVEMENTS.SECTION);
var map = oAchievements.achievementMap;

if (array_length_1d(types) > 0)
	with (oAchievements) {
		achievement_display = true;
		for (var i = 0; i < array_length_1d(types); i++)
			ds_list_add(achievement_display_list, types[i]);
	}

// GAMEMODE
for (var i = 0; i < array_length_1d(types); i++) {
	var type = scAchievementGetType(ACHIEVEMENT_TYPE.SECTION, types[i]); //Acheivement type
	var val = vals[i]; //Get value
	ini_write_real(sec, type, val); //Save value
}

ini_close(); //Close stream