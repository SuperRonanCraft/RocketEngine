function scUICharacterAccept(argument0) {
	//@arg force-confirm
	var value = argument0;

	ds_grid_destroy(ds_menu_main);
	if (player.player_aimode) {
		ds_menu_main = scUICreateMenuPage(
			["READY",		menu_element_type.toggle_live,	scUICharacterAccept,	noone,	value, "Accept character"],
			//[["<< PREV",	menu_centered.left],		menu_element_type.script_runner,	scUICharacterPrev],
			//[["NEXT >>",	menu_centered.right],		menu_element_type.script_runner,	scUICharacterNext],
		);
		//char_scale_cur_max = char_scale_cur_selected;
		selected = true;
		scUICharacterConfirm(false);
	} else if (value == 1) { //TRUE
		ds_menu_main = scUICreateMenuPage(
			["<< READY!",		menu_element_type.toggle_live,	scUICharacterAccept,	noone,	value, "Accept character"],
			//[["<< PREV",	menu_centered.left],		menu_element_type.script_runner,	scUICharacterPrev],
			//[["NEXT >>",	menu_centered.right],		menu_element_type.script_runner,	scUICharacterNext],
		);
		char_scale_cur_max = char_scale_cur_selected;
		scUICharacterConfirm(false);
	} else { //FALSE
		ds_menu_main = scUICreateMenuPage(
			["READY UP >>", menu_element_type.toggle_live,	scUICharacterAccept,	noone,	0],
			[["<<",	menu_centered.left],		menu_element_type.script_runner,	scUICharacterPrev, "Character"], //Prev character
			[[">>",	menu_centered.right],		menu_element_type.script_runner,	scUICharacterNext, "Character", -1], //Next character
			[["<<",	menu_centered.left],		menu_element_type.script_runner,	scUIPalettePrev, "Color"], //Prev Palette
			[[">>",	menu_centered.right],		menu_element_type.script_runner,	scUIPaletteNext, "Color", -1] //Next Palette
		);
		char_scale_cur_max = char_scale_cur_max_org;
		selected = false;
	}

	menu_pages = [ds_menu_main];


}
