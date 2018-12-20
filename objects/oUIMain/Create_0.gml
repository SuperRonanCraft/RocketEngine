event_inherited();

ds_menu_main = scUICreateMenuPage(
	["PLAY",		menu_element_type.page_transfer,	menu_page.gamemodes],
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings],
	["INFO",		menu_element_type.page_transfer,	menu_page.info],
	["QUIT",		menu_element_type.page_transfer,	menu_page.confirm],
);

ds_gamemodes = scUICreateMenuPage(
	[global.gamemodes[GAMEMODE.ONEVONE],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.ONEVONE],		"Play vs. another player"],
	[global.gamemodes[GAMEMODE.TARGETS],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.TARGETS],		"Shoot targets, not bombs..."],
	[global.gamemodes[GAMEMODE.KNOCKOUT],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.KNOCKOUT],	"Knock them off!"],
	["MORE...",			menu_element_type.page_transfer,	menu_page.more_gamemodes],
	["BACK",			menu_element_type.page_transfer,	menu_page.main],
);

ds_other_gamemodes = scUICreateMenuPage(
	[global.gamemodes[GAMEMODE.NUKED],		menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.NUKED],		"Duke Nuke'm!"],
	["BACK",			menu_element_type.page_transfer,	menu_page.gamemodes],
);

ds_info = scUICreateMenuPage(
	["ROCKETS",		menu_element_type.page_transfer,	menu_page.rocketlist],
	["BUFFS",		menu_element_type.page_transfer,	menu_page.rocketbuffs],
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls],
	["BACK",		menu_element_type.page_transfer,	menu_page.main],
);

ds_rocketinfo = scUICreateMenuPage(
	["",			menu_element_type.rocket_list],
	["BACK",		menu_element_type.page_transfer,	menu_page.info],
);

ds_controls = scUICreateMenuPage(
	["",			menu_element_type.controls],
	["KEYBINDS",	menu_element_type.page_transfer,	menu_page.keybinds2],
	["BACK",		menu_element_type.page_transfer,	menu_page.info],
);

ds_rocketbuffs = scUICreateMenuPage(
	["",		menu_element_type.rocket_buffs],
	["BACK",	menu_element_type.page_transfer,	menu_page.info],
);

ds_confirm = scUICreateMenuPage(
	["CONFIRM",		menu_element_type.script_runner,	scUIQuitGame, "Are you sure?"], //Only script that has text input
	["CANCEL",		menu_element_type.page_transfer,	menu_page.main],
);

//Same as normal keybinds, just set the back button to the controls page
ds_keybinds2 = ds_grid_create(ds_grid_width(ds_menu_keybinds), ds_grid_height(ds_menu_keybinds));
ds_grid_copy(ds_keybinds2, ds_menu_keybinds);
ds_keybinds2[# 2, ds_grid_height(ds_keybinds2) - 1] = menu_page.controls;

//Pages of the menu
menu_pages = [ds_menu_main, ds_gamemodes, ds_settings, ds_menu_audio, ds_menu_graphics,
	ds_menu_keybinds, ds_other_gamemodes, ds_info, ds_rocketinfo, ds_controls, ds_rocketbuffs,
	ds_keybinds2, ds_confirm];
//The page index values (must be in order)
menu_pages_index = [menu_page.main, menu_page.gamemodes, menu_page.settings, menu_page.audio, menu_page.graphics,
	menu_page.keybinds, menu_page.more_gamemodes, menu_page.info, menu_page.rocketlist, menu_page.controls, menu_page.rocketbuffs,
	menu_page.keybinds2, menu_page.confirm];
//Pages that are centered and have no input side
menu_pages_centered = [ds_menu_main, ds_gamemodes, ds_settings, ds_other_gamemodes, ds_info, ds_rocketinfo, ds_rocketbuffs, ds_controls, ds_confirm];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	for (var a = 0; a < array_length_1d(menu_special); a++) {
		var ds_grid = menu_pages[i];
		if (ds_grid[# 1, 0] == menu_special[a]) {menu_option[i] = 1; break;} //Default selection for each special page
		else menu_option[i] = 0; //Default selection for each page
	}
menu_option[0] = -1; //Default main page is -1 for the animation phase
	
for (var i = 0; i < ds_grid_height(menu_pages[menu_page.main]); i++)
	unfold[i] = 0; //Position multiplier of page text
	
scRockets(0); //Load in a copy of the rockets map for refrence