/// @description UI for stage select

yy = RES_H / 4;

//Setup ui
event_inherited();

switch (global.mode_1v1_singleplayer) {
	case 0: //1 vs 1
	case 1: //1 vs ai
		ds_menu_main = scUICreateMenuPage(
			["READY UP >>",menu_element_type.toggle_live,	scUICharacterAccept,	noone,	0, "Accept character"],
			[["<< PREV",	menu_centered.left],		menu_element_type.script_runner,	scUICharacterPrev],
			[["NEXT >>",	menu_centered.right],		menu_element_type.script_runner,	scUICharacterNext],
		);
		break;
	default:
		scUICharacterConfirm(true);
		exit;
		break;
}

selected = false;
player = oPlayer;

//Pages of the menu
menu_pages = [ds_menu_main];

//The page index values (must be in order)
menu_pages_index = [menu_page.main];

//Pages that are centered and have no input side
menu_pages_centered = [ds_menu_main];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = 0;

//Disabled unfolding
unfolding = false;