///@desc Start counting data


oDataCollector.games++;
scAddData("-------");
scAddData("GAME " + string(oDataCollector.games) + ":");


with (oDataCollector) {
	beginCount = true;
	timer = 0;
}