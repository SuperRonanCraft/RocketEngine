/// @description UI for stage select

xx = RES_W / 2;
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
char_last = noone;
char_scale_min = 1.2;
char_scale_b = char_scale_min;
char_scale_a = char_scale_min;
char_scale_cur_max = 2;
char_scale_cur = char_scale_cur_max;
char_x_offset = 100;
char_x = char_x_offset;
char_x_cur = 0;

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