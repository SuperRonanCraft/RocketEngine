///Page types
enum menu_page {
	main,
	gamemodes,
	settings,
	audio,
	graphics,
	controls,
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
}

//Default Menus
ds_settings = scCreateMenuPage(
	["AUDIO",			menu_element_type.page_transfer,	menu_page.audio],
	["GRAPHICS",		menu_element_type.page_transfer,	menu_page.graphics],
	["CONTROLS",		menu_element_type.page_transfer,	menu_page.controls],
	["BACK",			menu_element_type.page_transfer,	menu_page.main],
);

ds_menu_audio = scCreateMenuPage(
	["MASTER",			menu_element_type.slider,			change_volume,		"vol_master",	global.vol_master],
	["SOUNDS",			menu_element_type.slider,			change_volume,		"vol_sounds",	global.vol_sounds],
	["MUSIC",			menu_element_type.slider,			change_volume,		"vol_music",	global.vol_music],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_graphics = scCreateMenuPage(
	["FULLSCREEN",		menu_element_type.toggle,			change_window_mode,	"fullscreen",	global.fullscreen],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_controls = scCreateMenuPage(
	["JUMP P1",			menu_element_type.input,			"key_p1_jump",		global.key_p1_jump],
	["LEFT P1",			menu_element_type.input,			"key_p1_left",		global.key_p1_left],
	["RIGHT P1",		menu_element_type.input,			"key_p1_right",		global.key_p1_right],
	["SHOOT P1",		menu_element_type.input,			"key_p1_shoot",		global.key_p1_shoot],
	["JUMP P2",			menu_element_type.input,			"key_p2_jump",		global.key_p2_jump],
	["LEFT P2",			menu_element_type.input,			"key_p2_left",		global.key_p2_left],
	["RIGHT P2",		menu_element_type.input,			"key_p2_right",		global.key_p2_right],
	["SHOOT P2",		menu_element_type.input,			"key_p2_shoot",		global.key_p2_shoot],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings],
);

///Menu settings
//The page we are on
page = 0;
//The option we have selected in a page
menu_option = 0;
//All the pages we have loaded in a ui
menu_pages = 0;
//The enum id of each page
menu_pages_index = 0
//All the pages we want centered (should only be a 'script_runner', 'page_transfer' or 'goto_room')
menu_pages_centered = 0;
//If we are inputting values 'slider', 'shift', ;toggle' or 'input')
inputting = false;
//If we have refreshed the values to global values, such as the keybinds, resolution and volume
checked = false;
//Enable manipulating the menu
control = true;

///Mouse control
mouse_x_old = 0;
mouse_y_old = 0;
//Spacing between buttons
y_buffer = 64;
//Spaving between left value, the center line and the right values (does not affect centered pages)
x_buffer = 32;
//Updates on each page
start_y = 0;
start_x = 0;
spawn_x = RES_W / 4;
spawn_y = RES_H / 2;
//Is the mouse moving?
mouse_moving = false;

///Default things
depth -= 1;