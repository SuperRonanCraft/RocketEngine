/// @arg achivements[...
/// @arg values[...

var types = argument0;
var vals = argument1;

ini_open(scFileGetType(FILES.ACHIEVEMENTS)); //Open stream

//ACHIEVEMENTS
var sec = scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, ACHIEVEMENTS.SECTION);
var map = oAchievements.achievementMap;

if (ds_list_size(types) > 0)
	with (oAchievements) {
		achievement_display = true;
		for (var i = 0; i < ds_list_size(types); i++)
			ds_list_add(achievement_display_list, types[| i]);
	}

for (var i = 0; i < ds_list_size(types); i++) {
	var type = scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, types[| i]); //Acheivement type
	var val = vals[i]; //Get value
	ini_write_real(sec, type, val); //Save value
	oAchievements.achievementMap[? type] = val;
}

ini_close(); //Close stream

ds_list_destroy(types);
ds_list_destroy(vals);