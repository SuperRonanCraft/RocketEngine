/// @desc save a value to the database and save it to cache
/// @arg stat
/// @arg amount to add

var stat = argument[0];
var amt = argument[1];

scStatsCache(STATISTICS_TYPE.VALUE_GENERAL, [stat], [scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, stat) + amt]);