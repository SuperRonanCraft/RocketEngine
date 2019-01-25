/// @desc Reset gamemode
if (room == rMenu) {
	if (global.gamemode != noone)
	scStatsResetStage(true);
	global.gamemode = noone;
}