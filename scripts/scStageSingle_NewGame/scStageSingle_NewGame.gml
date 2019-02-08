//Remove control from menu
control = false;
//Reset stats
scStatsSet(GAMEMODE.SINGLE, [CACHE.GM_SINGLE_LEVEL, CACHE.GM_SINGLE_CHECKPOINT, CACHE.GM_SINGLE_NEWGAME], [noone, noone, true]);
//Go to room
SlideTransition(TRANS_MODE.GOTO, rSingleStage1);