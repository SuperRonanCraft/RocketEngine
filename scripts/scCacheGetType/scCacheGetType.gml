var val = "ERROR";
switch (argument0) {
	case CACHE.GM_TARGETS_POINTS: val = "points_"; break;
	case CACHE.GM_GENERAL_P1_WINS: val = "p1_wins_"; break;
	case CACHE.GM_GENERAL_P2_WINS: val = "p2_wins_"; break;
	case CACHE.ROCKETS_SHOT_P1: val = "rockets_shot_p1_"; break;
	case CACHE.ROCKETS_HIT_P1: val = "rockets_hit_p1_"; break;
	case CACHE.ROCKETS_SHOT_P2: val = "rockets_shot_p2_"; break;
	case CACHE.ROCKETS_HIT_P2: val = "rockets_hit_p2_"; break;
	case CACHE.TIME_PLAYED: val = "time_played_"; break;
}

return val;

enum CACHE {
	//GAMEMODES
	GM_TARGETS_POINTS,
	GM_GENERAL_P1_WINS,
	GM_GENERAL_P2_WINS,
	//PLAYER
	ROCKETS_SHOT_P1,
	ROCKETS_HIT_P1,
	ROCKETS_SHOT_P2,
	ROCKETS_HIT_P2,
	//GENERAL
	TIME_PLAYED
}