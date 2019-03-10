/// @desc achoievements that are always being checked
var achs = ds_list_create();
var achs_vals = ds_list_create();
var map = oAchievements.achievementMap;

//What to check every 10 seconds
var check = [ACHIEVEMENTS.ROCKETS_SHOT_100, ACHIEVEMENTS.ROCKETS_SHOT_1000, ACHIEVEMENTS.ROCKETS_SHOT_10000,
			ACHIEVEMENTS.TIME_PLAYED_10M, ACHIEVEMENTS.GAMES_COMPLETE_10];
//Values we expect to be equal or greater
var vals = [100, 1000, 10000, 10, 10];

//Check every achievement if NOT completed
for (var i = 0; i < array_length_1d(check); i++) {
	if (map[? scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, check[i])] == noone)
		if (scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING, check[i]) >= vals[i])  {
			ds_list_add(achs, check[i]);
			ds_list_add(achs_vals, true);
		}
}

scAchievementsCache(achs, achs_vals);