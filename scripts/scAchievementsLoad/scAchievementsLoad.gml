ini_open(scFileGetType(FILES.ACHIEVEMENTS)); //Open stream

//ACHIEVEMENTS
var sec = scAchievementGetType(ACHIEVEMENTS.SECTION);

var map = oAchievements.achievementMap;

for (var i = 0; i < array_length_1d(ACHIEVEMENTS.LENGTH); i++) {
	var val = scAchievementGetType(i);
	map[? val] = ini_read_real(sec, val, noone);
}

ini_close(); //Close stream