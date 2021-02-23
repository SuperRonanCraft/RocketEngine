/// @desc save all achievements
function scAchievementsSave() {

	ini_open(scFileGetType(FILES.ACHIEVEMENTS)); //Open stream

	//ACHIEVEMENTS
	var sec = scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, ACHIEVEMENTS.SECTION);
	var map = oAchievementHandler.achieve_map;

	for (var i = 0; i < ACHIEVEMENTS.SECTION; i++) {
		var key = scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, i); //Achievement type
		var val = map[? key]; //Get value
		ini_write_real(sec, key, val); //Save value
	}

	ini_close(); //Close stream


}
