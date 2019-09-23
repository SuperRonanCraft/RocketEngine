event_inherited();
//Default Menus
ds_settings = scUICreateMenuPage(
	["AUDIO",			menu_element_type.page_transfer,	menu_page.audio, "Change your hearing perspective"],
	["GRAPHICS",		menu_element_type.page_transfer,	menu_page.graphics, "Change your eyeballs perspective"],
	["KEYBINDS",		menu_element_type.page_transfer,	menu_page.keybinds_1, "Change your hands perspective"],
	["BACK",			menu_element_type.page_transfer,	menu_page.main],
);

ds_menu_audio = scUICreateMenuPage(
	["MASTER",			menu_element_type.slider,			scUIChangeVolume,		"vol_master",	global.vol_master,	0],
	["EFFECTS",			menu_element_type.slider,			scUIChangeVolume,		"vol_sounds",	global.vol_sounds,	1],
	["MUSIC",			menu_element_type.slider,			scUIChangeVolume,		"vol_music",	global.vol_music,	2],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_graphics = scUICreateMenuPage(
	["FULLSCREEN",	menu_element_type.toggle,	scUIToggleFullscreen,	"fullscreen",	global.fullscreen, "Toggle fullscreen mode"],
	["AUTO PAUSE",	menu_element_type.toggle,	noone,	"pause_onfocus",	global.pause_onfocus, "Pause game when unfocused"],
	["WEAPON INFO",	menu_element_type.toggle,	noone,	"weapon_info",	global.weapon_info, "Show cooldown, ammo and ultimate casts"],
	["DEBUG MODE",	menu_element_type.toggle,	noone,	"debug",	global.debug, "Collision, FPS and more! (DEV)"],
//	["HOVER COLOR",	menu_element_type.shift_script,	["ORANGE", "RED", "GREEN", "BLUE", "PURPLE", "WHITE"],	"menu_color_main",	
//		global.menu_color_hover, scUIMenuColor, "Make it colorful!"],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_keybinds_p1 = scUICreateMenuPage(
	//["PLAYER 1",	menu_element_type.title],
	["GAMEPAD TYPE",	menu_element_type.shift,	["KEYBOARD", "PS4", "XBOX"],	"gamepad_type",	global.gamepad_type, "Edit keybinds related to input style"],
	["JUMP",	menu_element_type.keybind,		SETTINGS.PLAYER_1_JUMP,			SETTINGS.PLAYER_1_JUMP_GP],
	["LEFT",	menu_element_type.keybind,		SETTINGS.PLAYER_1_LEFT,			SETTINGS.PLAYER_1_LEFT_GP],
	["RIGHT",	menu_element_type.keybind,		SETTINGS.PLAYER_1_RIGHT,		SETTINGS.PLAYER_1_RIGHT_GP],
	["SHOOT",	menu_element_type.keybind,		SETTINGS.PLAYER_1_SHOOT,		SETTINGS.PLAYER_1_SHOOT_GP],
	["ULTIMATE",	menu_element_type.keybind,	SETTINGS.PLAYER_1_ULTIMATE,		SETTINGS.PLAYER_1_ULTIMATE_GP],
	["ABILITY",	menu_element_type.keybind,		SETTINGS.PLAYER_1_ABILITY,		SETTINGS.PLAYER_1_ABILITY_GP],
	["PLAYER 2 >>",		menu_element_type.page_transfer,	menu_page.keybinds_2, "Edit player 2 keys"],
	["RESET",	menu_element_type.script_runner,	scUIResetKeybinds, "&cThis will reset all players keys!"],
	["BACK",	menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_keybinds_p2 = scUICreateMenuPage(
	//["PLAYER 2",	menu_element_type.title],
	["JUMP",		menu_element_type.keybind,	SETTINGS.PLAYER_2_JUMP,			SETTINGS.PLAYER_2_JUMP_GP],
	["LEFT",		menu_element_type.keybind,	SETTINGS.PLAYER_2_LEFT,			SETTINGS.PLAYER_2_LEFT_GP],
	["RIGHT",	menu_element_type.keybind,		SETTINGS.PLAYER_2_RIGHT,		SETTINGS.PLAYER_2_RIGHT_GP],
	["SHOOT",	menu_element_type.keybind,		SETTINGS.PLAYER_2_SHOOT,		SETTINGS.PLAYER_2_SHOOT_GP],
	["ULTIMATE",	menu_element_type.keybind,	SETTINGS.PLAYER_2_ULTIMATE,		SETTINGS.PLAYER_2_ULTIMATE_GP],
	["ABILITY",	menu_element_type.keybind,		SETTINGS.PLAYER_2_ABILITY,		SETTINGS.PLAYER_2_ABILITY_GP],
	["<< PLAYER 1",		menu_element_type.page_transfer,	menu_page.keybinds_1, "Edit player 1 keys"],
	["BACK",		menu_element_type.page_transfer,		menu_page.settings],
);