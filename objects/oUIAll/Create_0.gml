enum menu_page {
	main,
	settings,
	audio,
	graphics,
	controls,
	height
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

ds_menu_main = scCreateMenuPage(
	["RESUME",		menu_element_type.script_runner,	resume_game],
	["SETTING",		menu_element_type.page_transfer,	menu_page.settings],
	["EXIT",		menu_element_type.script_runner,	exit_game],
);

ds_settings = scCreateMenuPage(
	["AUDIO",		menu_element_type.page_transfer,	menu_page.audio],
	["GRAPHICS",	menu_element_type.page_transfer,	menu_page.graphics],
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls],
	["BACK",		menu_element_type.page_transfer,	menu_page.main],
);

ds_menu_audio = scCreateMenuPage(
	["MASTER",		menu_element_type.slider,			change_volume,		1,		[0,1]],
	["SOUNDS",		menu_element_type.slider,			change_volume,		1,		[0,1]],
	["MUSIC",		menu_element_type.slider,			change_volume,		1,		[0,1]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_graphics = scCreateMenuPage(
	["RESOLUTION",	menu_element_type.shift,			change_resolution,	0, ["512 x 374", "1024 x 748"]],
	["FULLSCREEN", menu_element_type.toggle,			change_window_mode,	1, ["FULLSCREEN", "WINDOWED"]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_controls = scCreateMenuPage(
	["JUMP P1",		menu_element_type.input,			"key_p1_jump",		global.key_p1_jump],
	["LEFT P1",		menu_element_type.input,			"key_p1_left",		global.key_p1_left],
	["RIGHT P1",	menu_element_type.input,			"key_p1_right",		global.key_p1_right],
	["SHOOT P1",	menu_element_type.input,			"key_p1_shoot",		global.key_p1_shoot],
	["JUMP P2",		menu_element_type.input,			"key_p2_jump",		global.key_p2_jump],
	["LEFT P2",		menu_element_type.input,			"key_p2_left",		global.key_p2_left],
	["RIGHT P2",	menu_element_type.input,			"key_p2_right",		global.key_p2_right],
	["SHOOT P2",	menu_element_type.input,			"key_p2_shoot",		global.key_p2_shoot],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
);

page = 0;
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = 0;
depth -= 1;
inputting = false;