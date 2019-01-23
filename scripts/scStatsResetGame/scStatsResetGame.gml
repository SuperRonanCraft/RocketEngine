//Reset all stats

var file = scFileGetType(FILES.DATABASE);
if (file_exists(file)) file_delete(file);

scStatsLoad();