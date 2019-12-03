/// @description UI for stage select

//Allow Tips
global.play = false;

xx = RES_W / 2;
yy = RES_H / 6;
xx2 = RES_W - RES_W / 6;
yy2 = RES_H - RES_H / 16;

//Setup ui
event_inherited();

ds_menu_main = scUICreateMenuPage(
	["Your Name",	menu_element_type.input_string,		global.network_name,	"network_name", false],
	["Continue",	menu_element_type.script_runner,	scUINetworkStart],
	["Back",		menu_element_type.script_runner,	scUIExitToGamemodeSelect]
);

ds_menu_type = scUICreateMenuPage(
	["Create Server",	menu_element_type.page_transfer,	menu_page.online],
	["Join Game",		menu_element_type.page_transfer,	menu_page.local],
	["Back",			menu_element_type.page_transfer,	menu_page.main]
	//["Back",		menu_element_type.script_runner,	scUIExitToGamemodeSelect]
);

ds_menu_create = scUICreateMenuPage(
	["Server IP",	menu_element_type.input_string,		global.network_ip,	"network_ip", false],
	["Create",	menu_element_type.script_runner,	scUINetworkCreate],
	["Back",		menu_element_type.page_transfer,	menu_page.modes]
);

ds_menu_join = scUICreateMenuPage(
	["Server IP",	menu_element_type.input_string,		global.network_ip,	"network_ip", false],
	["Join",	menu_element_type.script_runner,	scUINetworkJoin],
	["Back",		menu_element_type.page_transfer,	menu_page.modes]
);

//Pages of the menu
menu_pages = [ds_menu_main, ds_menu_type, ds_menu_create, ds_menu_join];
//The page index values (must be in order)
menu_pages_index = [menu_page.main, menu_page.modes, menu_page.online, menu_page.local];

//Pages that are centered and have no input side
menu_pages_centered = [ds_menu_type];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = 0;

//Disabled unfolding
unfolding = false;