/// @arg gamemode
var achs = ds_list_create();
var achs_vals = ds_list_create();
var map = oAchievements.achievementMap;

var gm = argument0;
switch (gm) {
	case GAMEMODE.ONEVONE:
		if (map[? scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, ACHIEVEMENTS.GM_1V1_MULTI)] == noone)
			if (global.mode_1v1_singleplayer == 0) //Played with a real person
				ds_list_add(achs, ACHIEVEMENTS.GM_1V1_MULTI);
				ds_list_add(achs_vals, true);
				break;
}

//var index = array_length_1d(achs);
//var ary = [ACHIEVEMENTS.]

scAchievementsSave(achs, achs_vals);