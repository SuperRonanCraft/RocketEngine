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
			default: val = "Something important"; break;
		}
		break;
	case ACHIEVEMENT_TYPE.DESCRIPTION: //DESCRIPTION OF ACHIEVEMENT
		switch (enu) {
			case ACHIEVEMENTS.GM_1V1_MULTI: val = "Play with one or more friends."; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_100: val = "Shoot 100 Rockets"; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_1000: val = "Shoot 1,000 Rockets"; break;
			case ACHIEVEMENTS.ROCKETS_SHOT_10000: val = "Shoot 10,000 Rockets"; break;
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
				val = "SHOTS: " + string(scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.ROCKETS_SHOT)); break;
			default: val = noone; break;
		}
		break;
}

return val;

enum ACHIEVEMENTS {
	//GAMEMODES
	GM_1V1_MULTI,
	ROCKETS_SHOT_100,
	ROCKETS_SHOT_1000,
	ROCKETS_SHOT_10000,
	//PLAYER
	//GENERAL
	SECTION,
	
	//KEEP LAST
	LENGTH
}

enum ACHIEVEMENT_TYPE {
	NAME, DESCRIPTION, ICON, SECTION, VALUE, TRACKING
}