///@desc Start counting data


oDataCollector.games++;
scAddData("-------");
scAddData("GAME " + string(oDataCollector.games) + ":");
ds_list_clear(oDataCollector.timeToHit)

with (oDataCollector) {
	beginCount = true;
	timer = 0;
}