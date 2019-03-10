event_inherited();

ds_menu_main = scUICreateMenuPage(
	["PLAY",		menu_element_type.page_transfer,	menu_page.gamemodes,	"Initiate gameplay!"],
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings,		"Change some levers and buttons"],
	["EXTRAS",		menu_element_type.page_transfer,	menu_page.info,			"Learn more about the game!"],
	["QUIT",		menu_element_type.page_transfer,	menu_page.confirm,		"&cDon't go!"]
);

ds_gamemodes = scUICreateMenuPage(
	[global.gamemodes[GAMEMODE.SINGLE],		menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.SINGLE],		"&cBETA, DO NOT PLAY!", true],
	[global.gamemodes[GAMEMODE.ONEVONE],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.ONEVONE],		"Play vs. another player", true],
	[global.gamemodes[GAMEMODE.KNOCKOUT],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.KNOCKOUT],	"Knock them off!", true],
	//[global.gamemodes[GAMEMODE.TARGETS],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.TARGETS],		"Shoot targets, not bombs...", true],
	//[global.gamemodes[GAMEMODE.RUMBLE],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.RUMBLE],		"Duke Nuke'm!"],
	["BACK",			menu_element_type.page_transfer,	menu_page.main]
);

ds_info = scUICreateMenuPage(
	["&eSTATISTICS",	menu_element_type.page_transfer,	menu_page.stats,		"&aCheck your game stats!"],
	["&eACHIEVEMENTS",	menu_element_type.page_transfer,	menu_page.achievements,	"&aGotta catch em all!"],
	["ROCKETS",		menu_element_type.page_transfer,	menu_page.rocketlist,	"Learn about every rocket available!"],
	["BUFFS",		menu_element_type.page_transfer,	menu_page.rocketbuffs,	"Get to know your buff!"],
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls,		"Can't aim? Check ur keys!"],
	["BACK",		menu_element_type.page_transfer,	menu_page.main]
);

ds_stats = scUICreateMenuPage(
	[global.gamemodes[GAMEMODE.ONEVONE],	menu_element_type.stats,	GAMEMODE.ONEVONE],
	[global.gamemodes[GAMEMODE.KNOCKOUT],	menu_element_type.stats,	GAMEMODE.KNOCKOUT],
	[global.gamemodes[GAMEMODE.TARGETS],	menu_element_type.stats,	GAMEMODE.TARGETS],
	[global.gamemodes[GAMEMODE.SINGLE],		menu_element_type.stats,	GAMEMODE.SINGLE],
	["RESET",		menu_element_type.script_runner,	scStatsResetGame, "&cThis will reset all stats!"],
	["BACK",		menu_element_type.page_transfer,	menu_page.info]
);

ds_rocketinfo = scUICreateMenuPage(
	["",			menu_element_type.rocket_list],
	[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scUIFlipPageRocketsPrev],
	[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scUIFlipPageRocketsNext],
	["BACK",		menu_element_type.page_transfer,	menu_page.info]
);
//Rockets page
page_rockets = 0;
rockets_list = ds_list_create();
rockets_img = 0;
rockets_spd = 0.25;
for (var i = ROCKET.DEFAULT; i < ROCKET.LENGHT; i++) {
	var map = scRocketGet(i)
	if (map[? ROCKET_MAP.ENABLED])
		ds_list_add(rockets_list, map);
	else
		ds_map_destroy(map);
}

ds_controls = scUICreateMenuPage(
	["",			menu_element_type.controls],
	["KEYBINDS",	menu_element_type.page_transfer,	menu_page.keybinds2, "Change your keys!"],
	["BACK",		menu_element_type.page_transfer,	menu_page.info]
);

ds_rocketbuffs = scUICreateMenuPage(
	["",		menu_element_type.rocket_buffs],
	[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scUIFlipPageBuffsPrev],
	[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scUIFlipPageBuffsNext],
	["BACK",	menu_element_type.page_transfer,	menu_page.info]
);
//Buffs page
page_buffs = 0;

//Achivements page
page_achievements = 0;

ds_achievements = scUICreateMenuPage(
	["",		menu_element_type.achievements],
	[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scUIFlipPageAchivementsPrev],
	[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scUIFlipPageAchivementsNext],
	["BACK",	menu_element_type.page_transfer,	menu_page.info]
);

ds_confirm = scUICreateMenuPage(
	["CONFIRM",		menu_element_type.script_runner,	scUIQuitGame, "Are you sure?"], //Only script that has text input
	["CANCEL",		menu_element_type.page_transfer,	menu_page.main]
);

//Same as normal keybinds, just set the back button to the controls page
ds_keybinds2 = ds_grid_create(ds_grid_width(ds_menu_keybinds), ds_grid_height(ds_menu_keybinds));
ds_grid_copy(ds_keybinds2, ds_menu_keybinds);
ds_keybinds2[# 2, ds_grid_height(ds_keybinds2) - 1] = menu_page.controls;

//Pages of the menu
menu_pages = [ds_menu_main, ds_gamemodes, ds_settings, ds_menu_audio, ds_menu_graphics,
	ds_menu_keybinds, ds_info, ds_rocketinfo, ds_controls, ds_rocketbuffs,
	ds_keybinds2, ds_confirm, ds_stats, ds_achievements];
//The page index values (must be in order)
menu_pages_index = [menu_page.main, menu_page.gamemodes, menu_page.settings, menu_page.audio, menu_page.graphics,
	menu_page.keybinds, menu_page.info, menu_page.rocketlist, menu_page.controls, menu_page.rocketbuffs,
	menu_page.keybinds2, menu_page.confirm, menu_page.stats, menu_page.achievements];
//Pages that are centered and have no input side
menu_pages_centered = [ds_menu_main, ds_gamemodes, ds_settings, ds_info, ds_rocketinfo, ds_rocketbuffs, ds_controls, ds_confirm, ds_achievements];

//Ignore specific menu elements from being selected
menu_special = [menu_element_type.rocket_buffs, menu_element_type.rocket_list, menu_element_type.controls, menu_element_type.stats, menu_element_type.achievements];
var pos = RES_H - (RES_H / 8) - (RES_H / 16);
menu_special_start_y = [pos + (RES_H / 16), pos + (RES_H / 16), pos, noone, pos + (RES_H / 16)];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	for (var a = 0; a < array_length_1d(menu_special); a++) {
		var ds_grid = menu_pages[i];
		if (ds_grid[# 1, 0] == menu_special[a]) menu_option[i] = 1; //Default selection for each special page
		else menu_option[i] = 0; //Default selection for each page
	}
menu_option[page] = -1; //Default main page is -1 for the animation phase

//Unfolding animation
unfolding = false;
for (var i = 0; i < ds_grid_height(menu_pages[menu_page.main]); i++)
	unfold[i] = 0; //Position multiplier of page text