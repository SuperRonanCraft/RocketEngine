//Remove control from menu
control = false;
//Get room
var level = scCacheGet(GAMEMODE.SINGLE, CACHE.GM_SINGLE_LEVEL);
//Go to room

SlideTransition(TRANS_MODE.GOTO, level);