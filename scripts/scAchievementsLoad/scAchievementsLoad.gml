ini_open(scFileGetType(FILES.ACHIEVEMENTS)); //Open stream

//ACHIEVEMENTS
var sec = scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, ACHIEVEMENTS.SECTION);

var map = oAchievements.achievementMap;

show_debug_message("LOADING ACHIEVEMENTS...");

for (var i = 0; i < ACHIEVEMENTS.SECTION; i++) {
	var val = scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, i);
	map[? val] = ini_read_real(sec, val, noone);
	show_debug_message("SECTION: " + string(val) + " VALUE: " + string(map[? val]));
}

ini_close(); //Close stream