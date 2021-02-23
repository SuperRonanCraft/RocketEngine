function scStageSingle_NewGame() {
	//Remove control from menu
	control = false;
	//Reset stats
	scStatsSet(GAMEMODE.SINGLE, [STATISTICS_GAMEMODE.GM_SINGLE_LEVEL, STATISTICS_GAMEMODE.GM_SINGLE_CHECKPOINT, STATISTICS_GAMEMODE.GM_SINGLE_NEWGAME], [noone, noone, true]);
	//Go to room
	SlideTransition(TRANS_MODE.GOTO, rSingleStage1);


}
