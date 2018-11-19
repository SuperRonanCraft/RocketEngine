event_inherited();
//MUST BE IN ORDER
enum menu_page {
	main,
	gamemodes,
	settings,
	audio,
	graphics,
	controls,
	height
}

ds_menu_main = scCreateMenuPage(
	["PLAY",			menu_element_type.page_transfer,	menu_page.gamemodes],
	["SETTINGS",		menu_element_type.page_transfer,	menu_page.settings],
	["QUIT",			menu_element_type.script_runner,	quit_game],
);

ds_gamemodes = scCreateMenuPage(
	["ONE V ONE",		menu_element_type.goto_room,		r1v1Select,			"Play  vs.  another  player"],
	["V TARGET",		menu_element_type.goto_room,		rvTargetSelect,		"Shoot  targets,  not  bombs..."],
	["KNOCK OUT",		menu_element_type.goto_room,		rKnockOutSelect,	"Knock  them  off!"],
	["BACK",			menu_element_type.page_transfer,	menu_page.main],
);

ds_settings = scCreateMenuPage(
	["AUDIO",			menu_element_type.page_transfer,	menu_page.audio],
	["GRAPHICS",		menu_element_type.page_transfer,	menu_page.graphics],
	["CONTROLS",		menu_element_type.page_transfer,	menu_page.controls],
	["BACK",			menu_element_type.page_transfer,	menu_page.main],
);

ds_menu_audio = scCreateMenuPage(
	["MASTER",			menu_element_type.slider,			change_volume,		"vol_master",	global.vol_master],
	["SOUNDS",			menu_element_type.slider,			change_volume,		"vol_sounds",	global.vol_sounds],
	["MUSIC",			menu_element_type.slider,			change_volume,		"vol_music",	global.vol_music],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_graphics = scCreateMenuPage(
	["FULLSCREEN",		menu_element_type.toggle,			change_window_mode,	"fullscreen",	global.fullscreen],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_controls = scCreateMenuPage(
	["JUMP P1",			menu_element_type.input,			"key_p1_jump",		global.key_p1_jump],
	["LEFT P1",			menu_element_type.input,			"key_p1_left",		global.key_p1_left],
	["RIGHT P1",		menu_element_type.input,			"key_p1_right",		global.key_p1_right],
	["SHOOT P1",		menu_element_type.input,			"key_p1_shoot",		global.key_p1_shoot],
	["JUMP P2",			menu_element_type.input,			"key_p2_jump",		global.key_p2_jump],
	["LEFT P2",			menu_element_type.input,			"key_p2_left",		global.key_p2_left],
	["RIGHT P2",		menu_element_type.input,			"key_p2_right",		global.key_p2_right],
	["SHOOT P2",		menu_element_type.input,			"key_p2_shoot",		global.key_p2_shoot],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

menu_pages = [ds_menu_main, ds_gamemodes, ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls];

menu_pages_centered = [ds_menu_main, ds_gamemodes, ds_settings];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = 0;