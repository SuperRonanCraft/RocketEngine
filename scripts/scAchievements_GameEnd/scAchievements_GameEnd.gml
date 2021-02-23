/// @arg gamemode
function scAchievements_GameEnd(argument0) {
	var achs = ds_list_create();
	var achs_vals = ds_list_create();
	var map = oAchievementHandler.achieve_map;

	var gm = argument0;
	switch (gm) {
		case GAMEMODE.ONEVONE:
			if (map[? scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, ACHIEVEMENTS.GM_1V1_MULTI)] == noone)
				if (global.mode_1v1_singleplayer == 0) {//Played with a real person
					ds_list_add(achs, ACHIEVEMENTS.GM_1V1_MULTI);
					ds_list_add(achs_vals, true);
					break;
				}
	}
	var games = scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.GAMES_COMPLETE);
	scStatsCache(STATISTICS_TYPE.VALUE_GENERAL, [STATISTICS_GENERAL.GAMES_COMPLETE], [games + 1]);

	scAchievementsCache(achs, achs_vals);


}
