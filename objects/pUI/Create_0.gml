///Page types
enum menu_page {
	main,
	gamemodes,
	more_gamemodes,
	settings,
	audio,
	graphics,
	keybinds, keybinds2,
	controls,
	info,
	rocketlist,
	rocketbuffs,
	confirm,
	height
}

///Kind of special elements
enum menu_element_type {
	//Run a script
	script_runner,
	//Go to another page (enum value)
	page_transfer,
	//Is a type of input
	slider,
	//Go from one value to another
	shift,
	//Toggle from true <-> false
	toggle,
	//Takes a key input
	input,
	//Go to a room
	goto_room,
	//List all rockets
	rocket_list,
	rocket_buffs,
	//Controls page
	controls
}

enum menu_centered {
	left,
	centered,
	right
}

//Default Menus
ds_settings = scUICreateMenuPage(
	["AUDIO",			menu_element_type.page_transfer,	menu_page.audio],
	["GRAPHICS",		menu_element_type.page_transfer,	menu_page.graphics],
	["KEYBINDS",		menu_element_type.page_transfer,	menu_page.keybinds],
	["BACK",			menu_element_type.page_transfer,	menu_page.main],
);

ds_menu_audio = scUICreateMenuPage(
	["MASTER",			menu_element_type.slider,			scUIChangeVolume,		"vol_master",	global.vol_master],
	["SOUNDS",			menu_element_type.slider,			scUIChangeVolume,		"vol_sounds",	global.vol_sounds],
	["MUSIC",			menu_element_type.slider,			scUIChangeVolume,		"vol_music",	global.vol_music],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_graphics = scUICreateMenuPage(
	["FULLSCREEN",		menu_element_type.toggle,			scUIToggleFullscreen,	"fullscreen",	global.fullscreen],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_keybinds = scUICreateMenuPage(
	["JUMP P1",			menu_element_type.input,			"key_p1_jump",		global.key_p1_jump],
	["LEFT P1",			menu_element_type.input,			"key_p1_left",		global.key_p1_left],
	["RIGHT P1",		menu_element_type.input,			"key_p1_right",		global.key_p1_right],
	["SHOOT P1",		menu_element_type.input,			"key_p1_shoot",		global.key_p1_shoot],
	["JUMP P2",			menu_element_type.input,			"key_p2_jump",		global.key_p2_jump],
	["LEFT P2",			menu_element_type.input,			"key_p2_left",		global.key_p2_left],
	["RIGHT P2",		menu_element_type.input,			"key_p2_right",		global.key_p2_right],
	["SHOOT P2",		menu_element_type.input,			"key_p2_shoot",		global.key_p2_shoot],
	["RESET KEYS",		menu_element_type.script_runner,	scUIResetKeybinds],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

///Menu settings
//The page we are on
page = 0;
//The option we have selected in a page (array)
menu_option = 0;
//All the pages we have loaded in a ui (array)
menu_pages = 0;
//The enum id of each page (array)
menu_pages_index = 0;
//All the pages we want centered (should only include 'script_runner', 'page_transfer' or 'goto_room' elements)
menu_pages_centered = 0;
//If we are inputting values 'slider', 'shift', 'toggle' or 'input')
inputting = false;
//If we have refreshed the values to global values, such as the keybinds, resolution and volume
checked = false;
//Enable manipulating the menu (must always be true by default)
control = true;

///Mouse control
mouse_x_old = device_mouse_x_to_gui(0);
mouse_y_old = device_mouse_y_to_gui(0);
//Spacing between buttons
y_buffer = 60;
//Spacing between left value, the center line and the right values (does not affect centered pages)
x_buffer = 32;
//Updates on each page
start_y = 0;
start_x = 0;
start_x_default = RES_W / 2;
start_y_default = RES_H / 2;
//Is the current menu unfolding? Will lock mouse control
unfolding = true;
//Ignore specific menu elements from being selected
menu_special = [menu_element_type.rocket_buffs, menu_element_type.rocket_list, menu_element_type.controls];
var pos = RES_H - RES_H / 8 - RES_H / 16;
menu_special_start_y = [pos, pos, pos];
//Update keybinds for players?
keys_update = false;

//Scale types
scale_main = 1;
scale_main_hovering = 1.2;
scale_comment = 0.45;
scale_element = 0.6;
scale_description = 0.45;
scale_option = noone; //An array of scales
scale_change = 0.05;

//Sizes
slider_width = 128;

//Colors
color_main = c_gray;
color_main_hovering = c_orange;
color_element = c_ltgray;
color_element_input = c_yellow;
color_element_input_unselected = c_black;
color_element_special = c_gray;
color_seperator = c_black;

//Used for scaling and knowing if we should work on a new pages variables
page_workingon = noone;
centered = true; //Is the whole page centered?

///Default things
depth -= 1;