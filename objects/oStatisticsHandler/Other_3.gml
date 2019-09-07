/// @desc save stats
var currenttime = scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.TIME_PLAYED);

scStatsCache(STATISTICS_TYPE.VALUE_GENERAL, [STATISTICS_GENERAL.TIME_PLAYED], [currenttime + (current_time / 1000)]);
scStatsSaveGeneral();