/// @desc
//ds_grid_destroy(ds_menu_main);
global.pause = false;
if (room == rMenu) {
	ds_grid_copy(ds_menu_main, scUICreateMenuPage(
		["RESUME",			menu_element_type.script_runner,	scUIResumeGame]
	));
} else {
	/*if (global.network_connected) {
		ds_menu_main = scUICreateMenuPage(
			["RESUME",			menu_element_type.script_runner,	scUIResumeGame, "Get back into the action!"],
			["SETTINGS",		menu_element_type.page_transfer,	menu_page.settings, "Change some levers and buttons"],
			["EXIT TO TITLE",	menu_element_type.page_transfer,	menu_page.confirm, "Leave your friends behind"], //Confirm you wanna exit
		);
	} else {*/
	if (global.gamestartphase) { //is in a real game
		//ds_grid_destroy(ds_confirm);
		ds_grid_copy(ds_confirm, scUICreateMenuPage(
			["CONFIRM",		menu_element_type.script_runner,	scUIExitToStageSelect, "Are you sure?"], //Only script that has text input
			["CANCEL",		menu_element_type.page_transfer,	menu_page.main],
		));
		ds_grid_copy(ds_menu_main, scUICreateMenuPage(
			["RESUME",			menu_element_type.script_runner,	scUIResumeGame, "Get back into the action!"],
			["SETTINGS",		menu_element_type.page_transfer,	menu_page.settings, "Change some levers and buttons"],
			["STAGE SELECT",	menu_element_type.page_transfer,	menu_page.confirm, "Leave your future"], //Confirm you wanna exit
		));
	} else
		ds_grid_copy(ds_menu_main, scUICreateMenuPage(
			["RESUME",			menu_element_type.script_runner,	scUIResumeGame, "Get back into the action!"],
			["SETTINGS",		menu_element_type.page_transfer,	menu_page.settings, "Change some levers and buttons"],
			["BACK TO TITLE",	menu_element_type.script_runner,	scUIExitToTitle, "Leave your friends behind"], //Confirm you wanna exit
		));
	//}
}

//menu_pages = [ds_menu_main, ds_confirm, ds_settings, ds_menu_audio, ds_menu_graphics, 
//	ds_menu_keybinds, ds_menu_keybinds_p1, ds_menu_keybinds_p2, ds_menu_controllers];
//menu_pages_centered = [ds_menu_main, ds_confirm, ds_settings, ds_menu_keybinds];

page_workingon = noone; //Setup the page