event_inherited();

ds_menu_main = scCreateMenuPage(
	["PLAY",			menu_element_type.page_transfer,	menu_page.gamemodes],
	["SETTINGS",		menu_element_type.page_transfer,	menu_page.settings],
	["INFO",			menu_element_type.page_transfer,	menu_page.rocketinfo],
	["QUIT",			menu_element_type.script_runner,	quit_game],
);

ds_gamemodes = scCreateMenuPage(
	[global.gamemodes[GAMEMODE.ONEVONE],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.ONEVONE],		"Play  vs.  another  player"],
	[global.gamemodes[GAMEMODE.TARGETS],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.TARGETS],		"Shoot  targets,  not  bombs..."],
	[global.gamemodes[GAMEMODE.KNOCKOUT],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.KNOCKOUT],	"Knock  them  off!"],
	["MORE...",			menu_element_type.page_transfer,	menu_page.more_gamemodes],
	["BACK",			menu_element_type.page_transfer,	menu_page.main],
);

ds_other_gamemodes = scCreateMenuPage(
	[global.gamemodes[GAMEMODE.NUKED],		menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.NUKED],		"Duke  Nuke'm!"],
	["BACK",			menu_element_type.page_transfer,	menu_page.gamemodes],
);

ds_rocketinfo = scCreateMenuPage(
	["",		menu_element_type.rocket_list],
	["BUFFS",	menu_element_type.page_transfer,	menu_page.rocketbuffs],
	["BACK",	menu_element_type.page_transfer,	menu_page.main],
);

ds_rocketbuffs = scCreateMenuPage(
	["",		menu_element_type.rocket_buffs],
	["BACK",	menu_element_type.page_transfer,	menu_page.rocketinfo],
);

//Pages of the menu
menu_pages = [ds_menu_main, ds_gamemodes, ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls, ds_other_gamemodes, ds_rocketinfo, ds_rocketbuffs];
//The page index values (must be in order)
menu_pages_index = [menu_page.main, menu_page.gamemodes, menu_page.settings, menu_page.audio, menu_page.graphics,
	menu_page.controls, menu_page.more_gamemodes, menu_page.rocketinfo, menu_page.rocketbuffs];
//Pages that are centered and have no input side
menu_pages_centered = [ds_menu_main, ds_gamemodes, ds_settings, ds_other_gamemodes, ds_rocketinfo, ds_rocketbuffs];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = -1; //Default selection for each page
	
for (var i = 0; i < ds_grid_height(menu_pages[menu_page.main]); i++)
	unfold[i] = 0; //Position multiplier of page text
	
scRockets(0); //Load in a copy of the rockets map for refrence