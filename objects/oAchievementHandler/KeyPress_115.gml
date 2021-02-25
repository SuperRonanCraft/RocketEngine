/// @desc fake achievement
var types = [ACHIEVEMENTS.COMBO, ACHIEVEMENTS.MEDIC];

//var index = array_length(achs);
//var ary = [ACHIEVEMENTS.]

if (array_length(types) > 0) {
	achievement_display = true;
	for (var i = 0; i < array_length(types); i++)
		ds_list_add(achievement_display_list, types[i]);
}

global.debug = true;