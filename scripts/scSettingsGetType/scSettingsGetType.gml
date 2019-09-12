/// @arg setting-type
/// @arg setting

var val = "ERROR";
var type = argument0;
var setting = argument1;
switch (type) {
	case SETTINGS_TYPE.SECTION:
		switch (setting) {
			case SETTINGS.SECTION:
				val = "Settings";
				break;
			case SETTINGS.PLAYER_1_CHARACTER:
				val = "player_1_character";
				break;
			case SETTINGS.PLAYER_2_CHARACTER:
				val = "player_2_character";
				break;
			case SETTINGS.PLAYER_3_CHARACTER:
				val = "player_3_character";
				break;
			case SETTINGS.PLAYER_4_CHARACTER:
				val = "player_4_character";
				break;
			default: val = noone; break;
		}
		break;
	case SETTINGS_TYPE.VALUE:
		val = oSettingsHandler.settings_map[? scSettingsGetType(SETTINGS_TYPE.SECTION, setting)];
		show_debug_message("RETURNING SETTING VALUE = " + string(val));
		show_debug_message("RETURNING SETTING ENUM = " + string(setting));
		break;
	default: show_debug_message("UNKNOWN SETTING " + string(type)); break;
}

return val;

enum SETTINGS {
	//GAMEMODES
	PLAYER_1_CHARACTER,
	PLAYER_2_CHARACTER,
	PLAYER_3_CHARACTER,
	PLAYER_4_CHARACTER,
	SECTION
}

enum SETTINGS_TYPE {
	VALUE,
	SECTION
}