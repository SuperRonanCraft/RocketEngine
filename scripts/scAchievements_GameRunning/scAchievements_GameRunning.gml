/// @desc achoievements that are always being checked
function scAchievements_GameRunning() {
	var achs = ds_list_create();
	var achs_vals = ds_list_create();
	var map = oAchievementHandler.achieve_map;
	
	if(room == rMenu)
		exit;

	/*//What to check every 10 seconds
	var check = [ACHIEVEMENTS.ROCKETS_SHOT_100, ACHIEVEMENTS.ROCKETS_SHOT_1000, ACHIEVEMENTS.ROCKETS_SHOT_10000,
				ACHIEVEMENTS.TIME_PLAYED_10M, ACHIEVEMENTS.GAMES_COMPLETE_10, ACHIEVEMENTS.ULTIMATES_CASTED_10, ACHIEVEMENTS.ROCKETS_CHANGED_10];
	//Values we expect to be equal or greater
	var vals = [100, 1000, 10000, 10, 10, 10, 10];*/

	//Check every achievement if NOT completed
	for (var i = 0; i < ACHIEVEMENTS.SECTION; i++) {
		//NOT GOTTEN THE ACHIEVEMENT && WE HAVE A GOAL
		if (map[? scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, i)] == noone && scAchievementsGetType(ACHIEVEMENT_TYPE.GOAL, i) != noone)
			if (scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING, i) >= scAchievementsGetType(ACHIEVEMENT_TYPE.GOAL, i))  {
				ds_list_add(achs, i);
				ds_list_add(achs_vals, true);
			}
	}

	scAchievementsCache(achs, achs_vals);


}
