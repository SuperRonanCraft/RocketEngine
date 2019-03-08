/// @arg achievement_display_list-enum

var val = "ERROR";
switch (argument0) {
	case ACHIEVEMENTS.GM_1V1_MULTI: val = "1v1_multiplayer_"; break;
	case ACHIEVEMENTS.SECTION: val = "Achievements."; break;
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