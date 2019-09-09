/// @desc fake achievement
var types = [ACHIEVEMENTS.GM_1V1_MULTI, ACHIEVEMENTS.ULTIMATES_CASTED_10];

//var index = array_length_1d(achs);
//var ary = [ACHIEVEMENTS.]

if (array_length_1d(types) > 0) {
	achievement_display = true;
	for (var i = 0; i < array_length_1d(types); i++)
		ds_list_add(achievement_display_list, types[i]);
}