/// @desc save a value to the database and save it to cache
/// @arg stat
/// @arg amount to add
/// @arg call-achievement-event*
function scStatsCacheAddGeneral() {

	var stat = argument[0];
	var amt = argument[1];
	var event = argument_count > 2 ? (argument[2] != noone ? argument[2] : true) : true;

	scStatsCache(STATISTICS_TYPE.VALUE_GENERAL, [stat], [scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, stat) + amt]);
	if (event)
		scAchievements_GameRunning(); //Call the achievement event


}
