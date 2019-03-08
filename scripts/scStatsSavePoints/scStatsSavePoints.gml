///@desc Collect outcome data

//WINNER / LOSER
if (global.winner == TEAM.LEFT) {
	global.score_mode_p1_wins++;
	global.score_stage_p1_wins++;
} else if (global.winner == TEAM.RIGHT) {
	global.score_mode_p2_wins++;
	global.score_stage_p2_wins++;
}

var gm = global.gamemode;
switch (gm) {
	case GAMEMODE.TARGETS:
		if (points > scCacheGet(gm, CACHE.GM_TARGETS_POINTS)) //High score
			scStatsSave(gm, [points]); break;
	default:
		//MODE P1, MODE P2, STAGE P1, STAGE P2
		var scr = [global.score_mode_p1_wins, global.score_mode_p2_wins, global.score_stage_p1_wins, global.score_stage_p2_wins];
		scStatsSave(gm, scr); //Save the stats to the file and cache
		break;
}