/// @desc achoievements that are always being checked
var achs = ds_list_create();
var achs_vals = ds_list_create();
var map = oAchievements.achievementMap;
show_debug_message("CHECKING ACHIEVEMENTS...");

//ROCKETS 100
if (map[? scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, ACHIEVEMENTS.ROCKETS_SHOT_100)] == noone)
	if (scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.ROCKETS_SHOT) >= 100)  {
		ds_list_add(achs, ACHIEVEMENTS.ROCKETS_SHOT_100);
		ds_list_add(achs_vals, true);
	}

//ROCKETS 1000
if (map[? scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, ACHIEVEMENTS.ROCKETS_SHOT_1000)] == noone)
	if (scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.ROCKETS_SHOT) >= 1000)  {
		ds_list_add(achs, ACHIEVEMENTS.ROCKETS_SHOT_1000);
		ds_list_add(achs_vals, true);
	}

//ROCKETS 10000
if (map[? scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, ACHIEVEMENTS.ROCKETS_SHOT_10000)] == noone)
	if (scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.ROCKETS_SHOT) >= 10000)  {
		ds_list_add(achs, ACHIEVEMENTS.ROCKETS_SHOT_10000);
		ds_list_add(achs_vals, true);
	}

//var index = array_length_1d(achs);
//var ary = [ACHIEVEMENTS.]

scAchievementsSave(achs, achs_vals);