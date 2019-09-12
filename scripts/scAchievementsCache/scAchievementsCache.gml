/// @arg achivements[...
/// @arg values[...

var types = argument[0];
var vals = argument[1];

//ACHIEVEMENTS

if (ds_list_size(types) > 0)
	with (oAchievementHandler) {
		achievement_display = true;
		for (var i = 0; i < ds_list_size(types); i++) //Display newly gotten achievements
			ds_list_add(achievement_display_list, types[| i]);
	}

for (var i = 0; i < ds_list_size(types); i++) {
	var type = scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, types[| i]); //Acheivement type
	var val = vals[| i]; //Get value
	oAchievementHandler.achieve_map[? type] = val; //Cache value
}

ds_list_destroy(types);
ds_list_destroy(vals);