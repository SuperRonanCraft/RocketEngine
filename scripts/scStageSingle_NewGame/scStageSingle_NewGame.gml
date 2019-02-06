//Remove control from menu
control = false;
//Reset stats
scStatsSet(GAMEMODE.SINGLE, [CACHE.GM_SINGLE_LEVEL, CACHE.GM_SINGLE_CHECKPOINT], [0, 0]);
//Go to room
SlideTransition(TRANS_MODE.GOTO, rSingleStage1);