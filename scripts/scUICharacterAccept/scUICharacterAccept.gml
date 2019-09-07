//@arg force-confirm
var value = argument0;

ds_grid_destroy(ds_menu_main);
if (value == 1) { //TRUE
	ds_menu_main = scUICreateMenuPage(
		["<< READY!",		menu_element_type.toggle_live,	scUICharacterAccept,	noone,	value, "Accept character"],
		//[["<< PREV",	menu_centered.left],		menu_element_type.script_runner,	scUICharacterPrev],
		//[["NEXT >>",	menu_centered.right],		menu_element_type.script_runner,	scUICharacterNext],
	);
	scUICharacterConfirm(false);
} else { //FALSE
	ds_menu_main = scUICreateMenuPage(
		["READY UP >>",menu_element_type.toggle_live,	scUICharacterAccept,	noone,	value, "Accept character"],
		[["<< PREV",	menu_centered.left],		menu_element_type.script_runner,	scUICharacterPrev],
		[["NEXT >>",	menu_centered.right],		menu_element_type.script_runner,	scUICharacterNext],
	);
	selected = false;
}

menu_pages = [ds_menu_main];