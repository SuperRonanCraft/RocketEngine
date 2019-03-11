/// @arg type
/// @arg enum
/// @arg gamemode*

var val = "ERROR";
var type = argument[0];
var enu = argument[1];
switch (type) {
	case STATISTICS_TYPE.SECTION_GAMEMODE:
		switch (enu) {
			case STATISTICS_GAMEMODE.GM_TARGETS_POINTS: val = "points_"; break;
			case STATISTICS_GAMEMODE.GM_SINGLE_LEVEL: val = "single_level_"; break;
			case STATISTICS_GAMEMODE.GM_SINGLE_CHECKPOINT: val = "single_checkpoint_"; break;
			case STATISTICS_GAMEMODE.GM_SINGLE_LIVES: val = "single_lives_"; break;
			case STATISTICS_GAMEMODE.GM_SINGLE_ROCKET: val = "single_rocket_"; break;
			case STATISTICS_GAMEMODE.GM_SINGLE_NEWGAME: val = "single_newgame_"; break;
			case STATISTICS_GAMEMODE.GM_GENERAL_P1_WINS: val = "p1_wins_"; break;
			case STATISTICS_GAMEMODE.GM_GENERAL_P2_WINS: val = "p2_wins_"; break;
			case STATISTICS_GAMEMODE.SECTION: val = "Statistics."; break;
			default: val = "ERROR"; show_debug_message("NO SECTION FOR ENUM " + string(enu)); break;
		}
		break;
	case STATISTICS_TYPE.SECTION_GENERAL:
		switch (enu) {
			case STATISTICS_GENERAL.ROCKETS_SHOT: val = "rockets_shot"; break;
			case STATISTICS_GENERAL.ROCKETS_HIT: val = "rockets_hit"; break;
			case STATISTICS_GENERAL.ULTIMATES_CASTED: val = "ultimates_used"; break;
			case STATISTICS_GENERAL.TIME_PLAYED: val = "time_played"; break;
			case STATISTICS_GENERAL.GAMES_COMPLETE: val = "games_complete"; break;
			case STATISTICS_GENERAL.ROCKETS_CHANGED: val = "rockets_changed"; break;
			case STATISTICS_GENERAL.SECTION: val = "General"; break;
			default: val = "ERROR"; show_debug_message("NO SECTION FOR ENUM " + string(enu)); break;
		}
		break;
	case STATISTICS_TYPE.VALUE_GAMEMODE:
		val = oDataCollector.data_cache[? scStatsGetType(STATISTICS_TYPE.SECTION_GAMEMODE, enu) + string(argument[2])]; break;
	case STATISTICS_TYPE.VALUE_GENERAL:
		val = oDataCollector.data_cache[? scStatsGetType(STATISTICS_TYPE.SECTION_GENERAL, enu)]; break;
}

return val;

enum STATISTICS_GAMEMODE {
	//GAMEMODES
	GM_TARGETS_POINTS,
	GM_SINGLE_LEVEL,
	GM_SINGLE_CHECKPOINT,
	GM_SINGLE_LIVES,
	GM_SINGLE_ROCKET,
	GM_SINGLE_NEWGAME,
	GM_GENERAL_P1_WINS,
	GM_GENERAL_P2_WINS,
	SECTION
}

enum STATISTICS_GENERAL { //AUTO CACHED WHEN GAME STARTS AND AUTO SAVED WHEN GAME CLOSED
	//PLAYER
	ROCKETS_SHOT,
	ROCKETS_HIT,
	ULTIMATES_CASTED,
	//GENERAL
	TIME_PLAYED,
	GAMES_COMPLETE,
	ROCKETS_CHANGED,
	SECTION //KEEP LAST
}

enum STATISTICS_TYPE {
	SECTION_GAMEMODE,
	VALUE_GAMEMODE, //Requires gamemode argument
	SECTION_GENERAL, 
	VALUE_GENERAL
}