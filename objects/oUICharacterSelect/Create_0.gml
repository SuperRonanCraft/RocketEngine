/// @description UI for stage select

xx = RES_W / 2;
yy = RES_H / 6;

//Setup ui
event_inherited();

scale_description_special = 0.7;

var ai_mode = 0;
switch (global.gamemode) {
	case GAMEMODE.ONEVONE: ai_mode = global.mode_1v1_singleplayer; break;
	case GAMEMODE.RUMBLE: ai_mode = global.mode_rumble_singleplayer; break;
}
switch (ai_mode) {
	case 0: //1 vs 1
	case 1: //1 vs ai
		ds_menu_main = scUICreateMenuPage(
			["READY UP >>", menu_element_type.toggle_live,	scUICharacterAccept,	noone,	0],
			[["<<",	menu_centered.left],		menu_element_type.script_runner,	scUICharacterPrev, "Character"], //Prev character
			[[">>",	menu_centered.right],		menu_element_type.script_runner,	scUICharacterNext, "Character", -1], //Next character
			[["<<",	menu_centered.left],		menu_element_type.script_runner,	scUIPalettePrev, "Color"], //Prev Palette
			[[">>",	menu_centered.right],		menu_element_type.script_runner,	scUIPaletteNext, "Color", -1] //Next Palette
		);
		break;
	default: //ai vs ai
		scUICharacterConfirm(true);
		exit;
		break;
}

selected = false;
player = oPlayer;
char_dir = 1;
char_last = 0;
char_palette = 0;
char_scale_min = 1.2;
char_scale_b = char_scale_min;
char_scale_a = char_scale_min;
char_scale_cur_max_org = 2;
char_scale_cur_selected = 3;
char_scale_cur_max = char_scale_cur_max_org;
char_scale_cur = char_scale_cur_max;
char_x_offset = 100;
char_x = 0;
char_img = 0;
//Animate/scale to player
char_animate = false;
char_animate_step = false; //first event of animation

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

//Load Player and Palette
if (instance_exists(player))
	with (player) {
		var char = player_map[? PLAYER_MAP.CHARACTER_INFO];
		if (char[? CHARACTER_MAP.TYPE] != undefined) {
			other.char_last = char[? CHARACTER_MAP.TYPE];
			other.char_palette = char[? CHARACTER_MAP.PALETTE_INDEX];
		}
	}