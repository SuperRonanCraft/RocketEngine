/// @desc 

// Inherit the parent event
event_inherited();

ds_menu_main = scUICreateMenuPage(
	["CONTINUE",		menu_element_type.script_runner,	scUIGamepadContinue, "Everything is okay"], //Prev Palette
	["CONTROLLERS",		menu_element_type.page_transfer,	menu_page.keybinds_controller, "Setup controllers for players"]
);

ds_menu_controllers = scUICreateMenuPage(
	["PLAYER 1",		menu_element_type.set_gamepad, SETTINGS.PLAYER_1_GAMEPAD, "Setup controllers for players"],
	["PLAYER 2",		menu_element_type.set_gamepad, SETTINGS.PLAYER_2_GAMEPAD, "Setup controllers for players"],
	["PLAYER 3",		menu_element_type.set_gamepad, SETTINGS.PLAYER_3_GAMEPAD, "Setup controllers for players"],
	["PLAYER 4",		menu_element_type.set_gamepad, SETTINGS.PLAYER_4_GAMEPAD, "Setup controllers for players"],
	["BACK",			menu_element_type.page_transfer,	menu_page.main]
);
		
//Pages of the menu
menu_pages = [ds_menu_main, ds_menu_controllers];

//The page index values (must be in order)
menu_pages_index = [menu_page.main, menu_page.keybinds_controller];

//Pages that are centered and have no input side
menu_pages_centered = [ds_menu_main];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = 0;