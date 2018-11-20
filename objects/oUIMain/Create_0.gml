event_inherited();
//MUST BE IN ORDER

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

menu_pages = [ds_menu_main, ds_gamemodes, ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls];
menu_pages_index = [menu_page.main, menu_page.gamemodes, menu_page.settings, menu_page.audio, menu_page.graphics, menu_page.controls];
menu_pages_centered = [ds_menu_main, ds_gamemodes, ds_settings];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = -1;