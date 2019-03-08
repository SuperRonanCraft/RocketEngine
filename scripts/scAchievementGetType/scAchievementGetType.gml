/// @arg type
/// @arg enum

var type = argument0
var enu = argument1;

var val = "ERROR";

switch (type) {
	case ACHIEVEMENT_TYPE.SECTION: //SECTION ID OF ACHIEVEMENT
		switch (enu) {
			case ACHIEVEMENTS.GM_1V1_MULTI: val = "1v1_multiplayer_"; break;
			case ACHIEVEMENTS.SECTION: val = "Achievements."; break;
		}
		break;
	case ACHIEVEMENT_TYPE.NAME: //NAME OF ACHIEVEMENT
		switch (enu) {
			case ACHIEVEMENTS.GM_1V1_MULTI: val = "Playing with friends!"; break;
		}
		break;
	case ACHIEVEMENT_TYPE.DESCRIPTION: //DESCRIPTION OF ACHIEVEMENT
		switch (enu) {
			case ACHIEVEMENTS.GM_1V1_MULTI: val = "Play with one or more friends."; break;
		}
		break;
	case ACHIEVEMENT_TYPE.ICON: //ICON OF ACHIEVEMENT
		switch (enu) {
			case ACHIEVEMENTS.GM_1V1_MULTI: val = s_abilityIcon_AntiHeal; break;
		}
		break;
}

return val;

enum ACHIEVEMENTS {
	//GAMEMODES
	GM_1V1_MULTI,
	//PLAYER
	//GENERAL
	SECTION,
	
	//KEEP LAST
	LENGTH
}

enum ACHIEVEMENT_TYPE {
	NAME, DESCRIPTION, ICON, SECTION
}