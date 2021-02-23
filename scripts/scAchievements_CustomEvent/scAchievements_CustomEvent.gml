/// @desc achievement to check
///@arg achievement-to-check
///@arg current-tracked-value
function scAchievements_CustomEvent(argument0, argument1) {
	var ach = argument0;
	var current_val = argument1;
	var map = oAchievementHandler.achieve_map;

	var achs = ds_list_create();
	var achs_vals = ds_list_create();
	//show_debug_message("CUSTOM ACHIEVEMENT EVENT!");
	//NOT GOTTEN THE ACHIEVEMENT && WE HAVE A GOAL
	if (map[? scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, ach)] == noone && scAchievementsGetType(ACHIEVEMENT_TYPE.GOAL, ach) != noone)
		if (current_val >= scAchievementsGetType(ACHIEVEMENT_TYPE.GOAL, ach)) {
			ds_list_add(achs, ach);
			ds_list_add(achs_vals, true);
		} else
			exit;
	else
		exit;
		
	scAchievementsCache(achs, achs_vals);


}
