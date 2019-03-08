/// @desc fake achievement
var types = [ACHIEVEMENTS.GM_1V1_MULTI];

//var index = array_length_1d(achs);
//var ary = [ACHIEVEMENTS.]

if (array_length_1d(types) > 0)
	with (oAchievements) {
		achievement_display = true;
		for (var i = 0; i < array_length_1d(types); i++)
			ds_list_add(achievement_display_list, types[i]);
	}