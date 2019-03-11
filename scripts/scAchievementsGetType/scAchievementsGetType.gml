/// @arg type
/// @arg enum

var type = argument0
var enu = argument1;

var val = "ERROR";

switch (type) {
	case ACHIEVEMENT_TYPE.SECTION: //SECTION ID OF ACHIEVEMENT
		switch (enu) { //REQUIRED
			case ACHIEVEMENTS.GM_1V1_MULTI: val = "1v1_multiplayer_"; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_100: val = "rockets_100_"; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_1000: val = "rockets_1000_"; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_10000: val = "rockets_10000_"; break;
			case ACHIEVEMENTS.TIME_PLAYED_10M: val = "time_played_10m_"; break;
			case ACHIEVEMENTS.GAMES_COMPLETE_10: val = "games_complete_"; break;
			case ACHIEVEMENTS.ULTIMATES_CASTED_10: val = "ultimates_used_"; break;
			case ACHIEVEMENTS.SECTION: val = "Achievements."; break;
			default: val = "ERROR"; show_debug_message("NO SECTION FOR ENUM " + string(enu)); break;
		}
		break;
	case ACHIEVEMENT_TYPE.NAME: //NAME OF ACHIEVEMENT
		switch (enu) {
			case ACHIEVEMENTS.GM_1V1_MULTI: val = "Playing with friends!"; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_100: val = "Rocket Noob!"; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_1000: val = "Rocket Frenzy!"; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_10000: val = "Rocket Expert!"; break;
			case ACHIEVEMENTS.TIME_PLAYED_10M: val = "Just getting started"; break;
			case ACHIEVEMENTS.GAMES_COMPLETE_10: val = "Warming up"; break;
			case ACHIEVEMENTS.ULTIMATES_CASTED_10: val = "Ultimate Seaker"; break;
			default: val = "Something important"; break;
		}
		break;
	case ACHIEVEMENT_TYPE.DESCRIPTION: //DESCRIPTION OF ACHIEVEMENT
		switch (enu) {
			case ACHIEVEMENTS.GM_1V1_MULTI: val = "Play with one or more friends."; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_100: val = "Shoot 100 Rockets"; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_1000: val = "Shoot 1,000 Rockets"; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_10000: val = "Shoot 10,000 Rockets"; break;
			case ACHIEVEMENTS.TIME_PLAYED_10M: val = "Play for 10 Minutes"; break;
			case ACHIEVEMENTS.GAMES_COMPLETE_10: val = "Play 10 games"; break;
			case ACHIEVEMENTS.ULTIMATES_CASTED_10: val = "Cast 10 ultimates"; break;
			default: val = "An achievement"; break;
		}
		break;
	case ACHIEVEMENT_TYPE.ICON: //ICON OF ACHIEVEMENT
		switch (enu) {
			case ACHIEVEMENTS.GM_1V1_MULTI: val = s_abilityIcon_AntiHeal; break;
			default: val = sTargetBomb; break;
		}
		break;
	case ACHIEVEMENT_TYPE.VALUE:
		val = oAchievements.achievementMap[? scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, enu)]; break;
	case ACHIEVEMENT_TYPE.TRACKING:
		switch (enu) {
			case ACHIEVEMENTS.ROCKETS_SHOT_10000:
			case ACHIEVEMENTS.ROCKETS_SHOT_1000:
			case ACHIEVEMENTS.ROCKETS_SHOT_100:
				val = scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.ROCKETS_SHOT); break;
			case ACHIEVEMENTS.TIME_PLAYED_10M:
				val = floor((scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.TIME_PLAYED) + (current_time / 1000)) / 60); break;
			case ACHIEVEMENTS.GAMES_COMPLETE_10:
				val = scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.GAMES_COMPLETE); break;
			case ACHIEVEMENTS.ULTIMATES_CASTED_10:
				val = scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.ULTIMATES_CASTED); break;
			default: val = noone; break;
		}
		break;
	case ACHIEVEMENT_TYPE.TRACKING_DESC:
		switch (enu) {
			case ACHIEVEMENTS.ROCKETS_SHOT_10000:
			case ACHIEVEMENTS.ROCKETS_SHOT_1000:
			case ACHIEVEMENTS.ROCKETS_SHOT_100:
				val = "Rockets Shot: " + string(scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING, ACHIEVEMENTS.ROCKETS_SHOT_100)); break;
			case ACHIEVEMENTS.TIME_PLAYED_10M:
				var time = scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING, ACHIEVEMENTS.TIME_PLAYED_10M); //Minutes
				var minutes = floor(time) mod 60;
				var hours = floor(time / 60) mod 24;
				var days = floor((time / 60) / 24);
				val = string(days) + " days, " + string(hours) + " hours, " + string(minutes) + " minutes"; break;
			case ACHIEVEMENTS.GAMES_COMPLETE_10:
				val = "Games Played: " + string(scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING, ACHIEVEMENTS.GAMES_COMPLETE_10)); break;
			case ACHIEVEMENTS.ULTIMATES_CASTED_10:
				val = "Ultimates Casted: " + string(scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING, ACHIEVEMENTS.ULTIMATES_CASTED_10)); break;
			default: val = noone; break;
		}
		break;
}

return val;

enum ACHIEVEMENTS { //Shows up by order
	//GAMEMODES
	GM_1V1_MULTI,
	GAMES_COMPLETE_10,
	ULTIMATES_CASTED_10,
	ROCKETS_SHOT_100,
	ROCKETS_SHOT_1000,
	ROCKETS_SHOT_10000,
	TIME_PLAYED_10M,
	//Keep last
	SECTION,
	LENGTH
}

enum ACHIEVEMENT_TYPE {
	NAME, DESCRIPTION, ICON, SECTION, VALUE, TRACKING, TRACKING_DESC
}