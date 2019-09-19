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
	["JUMP",		menu_element_type.input_cache,		SETTINGS.PLAYER_1_JUMP,		scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_JUMP)],
	["LEFT",		menu_element_type.input_cache,		SETTINGS.PLAYER_1_LEFT,		scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_LEFT)],
	["RIGHT",	menu_element_type.input_cache,		SETTINGS.PLAYER_1_RIGHT,	scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_RIGHT)],
	["SHOOT",	menu_element_type.input_cache,		SETTINGS.PLAYER_1_SHOOT,	scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_SHOOT)],
	["ULTIMATE",	menu_element_type.input_cache,		SETTINGS.PLAYER_1_ULTIMATE,	scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_ULTIMATE)],
	["ABILITY",	menu_element_type.input_cache,		SETTINGS.PLAYER_1_ABILITY,	scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_ABILITY)],
	["PLAYER 2 >>",		menu_element_type.page_transfer,	menu_page.keybinds_2, "Edit player 2 keys"],
	["RESET",		menu_element_type.script_runner,	scUIResetKeybinds, "&cThis will reset all players keys!"],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_keybinds_p2 = scUICreateMenuPage(
	//["PLAYER 2",	menu_element_type.title],
	["JUMP",		menu_element_type.input_cache,		SETTINGS.PLAYER_2_JUMP,		scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_JUMP)],
	["LEFT",		menu_element_type.input_cache,		SETTINGS.PLAYER_2_LEFT,		scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_LEFT)],
	["RIGHT",	menu_element_type.input_cache,		SETTINGS.PLAYER_2_RIGHT,	scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_RIGHT)],
	["SHOOT",	menu_element_type.input_cache,		SETTINGS.PLAYER_2_SHOOT,	scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_SHOOT)],
	["ULTIMATE",	menu_element_type.input_cache,		SETTINGS.PLAYER_2_ULTIMATE,	scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_ULTIMATE)],
	["ABILITY",	menu_element_type.input_cache,		SETTINGS.PLAYER_2_ABILITY,	scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_ABILITY)],
	["<< PLAYER 1",		menu_element_type.page_transfer,	menu_page.keybinds_1, "Edit player 2 keys"],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
);