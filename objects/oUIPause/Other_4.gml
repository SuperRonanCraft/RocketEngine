/// @desc
ds_grid_destroy(ds_menu_main);
if (room == rMenu) {
	ds_menu_main = scUICreateMenuPage(
		["RESUME",			menu_element_type.script_runner,	scUIResumeGame]
	);
} else {
	ds_menu_main = scUICreateMenuPage(
		["RESUME",			menu_element_type.script_runner,	scUIResumeGame, "Get back into the action!"],
		["SETTINGS",		menu_element_type.page_transfer,	menu_page.settings, "Change some levers and buttons"],
		["EXIT TO TITLE",	menu_element_type.page_transfer,	menu_page.confirm, "Leave your friends behind"], //Confirm you wanna exit
	);
}

page_workingon = noone; //Setup the page