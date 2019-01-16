/// @desc
ds_grid_destroy(ds_menu_main);
if (room == rMenu) {
	ds_menu_main = scUICreateMenuPage(
		["RESUME",			menu_element_type.script_runner,	scUIResumeGame]
	);
} else {
	ds_menu_main = scUICreateMenuPage(
		["RESUME",			menu_element_type.script_runner,	scUIResumeGame],
		["SETTINGS",		menu_element_type.page_transfer,	menu_page.settings],
		["EXIT TO TITLE",	menu_element_type.page_transfer,	menu_page.confirm], //Confirm you wanna exit
	);
}