event_inherited();
enum pause_page {
	main,
	settings,
	audio,
	graphics,
	controls,
	height
}

ds_menu_main = scCreateMenuPage(
	["RESUME",			menu_element_type.script_runner,	resume_game],
	["SETTINGS",		menu_element_type.page_transfer,	pause_page.settings],
	["EXIT  TO  TITLE",	menu_element_type.script_runner,	exit_game],
);

ds_settings = scCreateMenuPage(
	["AUDIO",			menu_element_type.page_transfer,	pause_page.audio],
	["GRAPHICS",		menu_element_type.page_transfer,	pause_page.graphics],
	["CONTROLS",		menu_element_type.page_transfer,	pause_page.controls],
	["BACK",			menu_element_type.page_transfer,	pause_page.main],
);

ds_menu_audio = scCreateMenuPage(
	["MASTER",			menu_element_type.slider,			change_volume,		"vol_master",	global.vol_master],
	["SOUNDS",			menu_element_type.slider,			change_volume,		"vol_sounds",	global.vol_sounds],
	["MUSIC",			menu_element_type.slider,			change_volume,		"vol_music",	global.vol_music],
	["BACK",			menu_element_type.page_transfer,	pause_page.settings],
);

ds_menu_graphics = scCreateMenuPage(
	["FULLSCREEN",		menu_element_type.toggle,			change_window_mode,	"fullscreen",	global.fullscreen],
	["BACK",			menu_element_type.page_transfer,	pause_page.settings],
);

ds_menu_controls = scCreateMenuPage(
	["JUMP P1",			menu_element_type.input,			"key_p1_jump"], //global.key_p1_jump
	["LEFT P1",			menu_element_type.input,			"key_p1_left"], //global.key_p1_left
	["RIGHT P1",		menu_element_type.input,			"key_p1_right"],//global.key_p1_right
	["SHOOT P1",		menu_element_type.input,			"key_p1_shoot"],//global.key_p1_shoot
	["JUMP P2",			menu_element_type.input,			"key_p2_jump"],	//global.key_p2_jump
	["LEFT P2",			menu_element_type.input,			"key_p2_left"],	//global.key_p2_left
	["RIGHT P2",		menu_element_type.input,			"key_p2_right"],//global.key_p2_right
	["SHOOT P2",		menu_element_type.input,			"key_p2_shoot"],//global.key_p2_shoot
	["BACK",			menu_element_type.page_transfer,	pause_page.settings],
);
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls];

menu_pages_centered = [ds_menu_main, ds_settings];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = 0;
depth -= 1;