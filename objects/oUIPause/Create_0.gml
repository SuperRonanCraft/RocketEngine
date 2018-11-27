event_inherited();

ds_menu_main = scCreateMenuPage(
	["RESUME",			menu_element_type.script_runner,	resume_game],
	["SETTINGS",		menu_element_type.page_transfer,	menu_page.settings],
	["EXIT  TO  TITLE",	menu_element_type.script_runner,	exit_game],
);

menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls];
menu_pages_index = [menu_page.main, menu_page.settings, menu_page.audio, menu_page.graphics, menu_page.controls];
menu_pages_centered = [ds_menu_main, ds_settings];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = 0;
depth -= 1;

var btns = ds_grid_height(menu_pages[menu_page.main]);
for (var i = 0; i < btns; i++)
	unfold[i] = 0;