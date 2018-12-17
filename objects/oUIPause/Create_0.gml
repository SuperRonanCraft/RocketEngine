event_inherited();

ds_menu_main = scUICreateMenuPage(
	["RESUME",			menu_element_type.script_runner,	scUIResumeGame],
	["SETTINGS",		menu_element_type.page_transfer,	menu_page.settings],
	["EXIT TO TITLE",	menu_element_type.script_runner,	scUIExitToTitle],
);

//Pages of the menu
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_keybinds];
//The page index values (must be in order)
menu_pages_index = [menu_page.main, menu_page.settings, menu_page.audio, menu_page.graphics, menu_page.keybinds];
//Pages that are centered and have no input side
menu_pages_centered = [ds_menu_main, ds_settings];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = 0;
depth -= 1;

//Disabled unfolding
unfolding = false;

//Set default font
draw_set_font(fPixel);