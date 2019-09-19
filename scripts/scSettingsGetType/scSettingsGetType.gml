/// @arg setting-type
/// @arg setting

var val = "ERROR";
var type = argument0;
var setting = argument1;
switch (type) {
	case SETTINGS_TYPE.SECTION:
		switch (setting) {
			case SETTINGS.SECTION: val = "Settings"; break;
			case SETTINGS.PLAYER_1_CHARACTER: val = "player_1_character"; break;
			case SETTINGS.PLAYER_2_CHARACTER: val = "player_2_character"; break;
			case SETTINGS.PLAYER_3_CHARACTER: val = "player_3_character"; break;
			case SETTINGS.PLAYER_4_CHARACTER: val = "player_4_character"; break;
			case SETTINGS.PLAYER_1_LEFT: val = "player_1_left"; break;
			case SETTINGS.PLAYER_1_RIGHT: val = "player_1_right"; break;
			case SETTINGS.PLAYER_1_JUMP: val = "player_1_jump"; break;
			case SETTINGS.PLAYER_1_SHOOT: val = "player_1_shoot"; break;
			case SETTINGS.PLAYER_1_ABILITY: val = "player_1_ability"; break;
			case SETTINGS.PLAYER_1_ULTIMATE: val = "player_1_ultimate"; break;
			case SETTINGS.PLAYER_2_LEFT: val = "player_2_left"; break;
			case SETTINGS.PLAYER_2_RIGHT: val = "player_2_right"; break;
			case SETTINGS.PLAYER_2_JUMP: val = "player_2_jump"; break;
			case SETTINGS.PLAYER_2_SHOOT: val = "player_2_shoot"; break;
			case SETTINGS.PLAYER_2_ABILITY: val = "player_2_ability"; break;
			case SETTINGS.PLAYER_2_ULTIMATE: val = "player_2_ultimate"; break;
			default: val = noone; break;
		}
		break;
	case SETTINGS_TYPE.DEFAULT:
		switch (setting) {
			case SETTINGS.PLAYER_1_LEFT: val = ord("A"); break;
			case SETTINGS.PLAYER_1_RIGHT: val = ord("D"); break;
			case SETTINGS.PLAYER_1_JUMP: val = ord("W"); break;
			case SETTINGS.PLAYER_1_SHOOT: val = ord("S"); break;
			case SETTINGS.PLAYER_1_ABILITY: val = ord("E"); break;
			case SETTINGS.PLAYER_1_ULTIMATE: val = ord("Q"); break;
			case SETTINGS.PLAYER_2_LEFT: val = vk_left; break;
			case SETTINGS.PLAYER_2_RIGHT: val = vk_right; break;
			case SETTINGS.PLAYER_2_JUMP: val = vk_up; break;
			case SETTINGS.PLAYER_2_SHOOT: val = vk_down; break;
			case SETTINGS.PLAYER_2_ABILITY: val = ord("<"); break;
			case SETTINGS.PLAYER_2_ULTIMATE: val = ord(">"); break;
			default: val = 0; break;
		}
		break;
	case SETTINGS_TYPE.VALUE:
		val = oSettingsHandler.settings_map[? scSettingsGetType(SETTINGS_TYPE.SECTION, setting)];
		//show_debug_message("RETURNING SETTING VALUE = " + string(val));
		//show_debug_message("RETURNING SETTING ENUM = " + string(setting));
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
	//Keybinds 1
	PLAYER_1_LEFT,
	PLAYER_1_RIGHT,
	PLAYER_1_JUMP,
	PLAYER_1_SHOOT,
	PLAYER_1_ABILITY,
	PLAYER_1_ULTIMATE,
	//Keybinds 2
	PLAYER_2_LEFT,
	PLAYER_2_RIGHT,
	PLAYER_2_JUMP,
	PLAYER_2_SHOOT,
	PLAYER_2_ABILITY,
	PLAYER_2_ULTIMATE,
	SECTION
}

enum SETTINGS_TYPE {
	VALUE,
	DEFAULT,
	SECTION
}