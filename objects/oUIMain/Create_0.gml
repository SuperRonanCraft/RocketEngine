event_inherited();

ds_menu_main = scUICreateMenuPage(
	["PLAY",		menu_element_type.page_transfer,	menu_page.gamemodes,	"Initiate gameplay!"],
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings,		"Change some levers and buttons"],
	["EXTRAS",		menu_element_type.page_transfer,	menu_page.info,			"Learn more about the game!"],
	["QUIT",		menu_element_type.page_transfer,	menu_page.confirm,		"&cDon't go!"]
);

ds_gamemodes = scUICreateMenuPage(
	//[global.gamemodes[GAMEMODE.SINGLE],		menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.SINGLE],		"&cBETA, DO NOT PLAY!", true],
	[global.gamemodes[GAMEMODE.ONEVONE],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.ONEVONE],		"Play vs. another player",		true],
	[global.gamemodes[GAMEMODE.RUMBLE],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.RUMBLE],			"Duke it out!",			true],
	[global.gamemodes[GAMEMODE.KNOCKOUT],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.KNOCKOUT],	"Knock them off!",		true],
	[global.gamemodes[GAMEMODE.TARGETS],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.TARGETS],		"Shoot targets, not bombs...",	true],
	["BACK",			menu_element_type.page_transfer,	menu_page.main]
);

ds_info = scUICreateMenuPage(
	["&eSTATISTICS",	menu_element_type.page_transfer,	menu_page.stats,		"&aCheck your game stats!"],
	["&eACHIEVEMENTS",	menu_element_type.page_transfer,	menu_page.list_achievements,	"&aGotta catch em all!"],
	["MODIFIERS",		menu_element_type.page_transfer,	menu_page.list_weapons,	"Learn about every weapon modifier!"],
	["BUFFS",		menu_element_type.page_transfer,	menu_page.list_buffs,	"Get to know your buff!"],
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls,		"Can't aim? Check ur keys!"],
	//[global.gamemodes[GAMEMODE.TUTORIAL],	menu_element_type.goto_room,	global.gamemodeSRoom[GAMEMODE.TUTORIAL],	"Learn how to play!"],
	["BACK",		menu_element_type.page_transfer,	menu_page.main]
);

ds_stats = scUICreateMenuPage(
	[global.gamemodes[GAMEMODE.ONEVONE],	menu_element_type.stats,	GAMEMODE.ONEVONE],
	[global.gamemodes[GAMEMODE.KNOCKOUT],	menu_element_type.stats,	GAMEMODE.KNOCKOUT],
	[global.gamemodes[GAMEMODE.TARGETS],	menu_element_type.stats,	GAMEMODE.TARGETS],
	//[global.gamemodes[GAMEMODE.SINGLE],		menu_element_type.stats,	GAMEMODE.SINGLE],
	["RESET",		menu_element_type.script_runner,	scStatsResetGame, "&cThis will reset all stats!"],
	["BACK",		menu_element_type.page_transfer,	menu_page.info]
);

ds_list_weapons = scUICreateMenuPage(
	["",			menu_element_type.list_weapons],
	[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scUIFlipPageWeaponPrev],
	[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scUIFlipPageWeaponNext],
	["BACK",		menu_element_type.page_transfer,	menu_page.info]
);
//Weapons page
page_weapons = 0;

ds_controls = scUICreateMenuPage(
	["",			menu_element_type.controls],
	//["GAMEPAD TYPE",	menu_element_type.shift,	["KEYBOARD", "PS4", "XBOX"],	"gamepad_type",	global.gamepad_type],
	["KEYBINDS",	menu_element_type.page_transfer,	menu_page.keybinds, "Change your keys!"],
	["BACK",		menu_element_type.page_transfer,	menu_page.info]
);

ds_list_buffs = scUICreateMenuPage(
	["",		menu_element_type.list_buffs],
	[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scUIFlipPageBuffsPrev],
	[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scUIFlipPageBuffsNext],
	["BACK",	menu_element_type.page_transfer_script,	menu_page.info, scParticlesClear]
);
//Buffs page
page_buffs = 0;

//Achivements page
page_achievements = 1;

ds_list_achievements = scUICreateMenuPage(
	["",		menu_element_type.list_achievements],
	[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scUIFlipPageAchivementsPrev],
	[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scUIFlipPageAchivementsNext],
	["BACK",	menu_element_type.page_transfer,	menu_page.info]
);

ds_confirm = scUICreateMenuPage(
	["CONFIRM",		menu_element_type.script_runner,	scUIQuitGame, "Are you sure?"], //Only script that has text input
	["CANCEL",		menu_element_type.page_transfer,	menu_page.main]
);

//Pages of the menu
menu_pages = [ds_menu_main, ds_gamemodes, ds_settings, ds_menu_audio, ds_menu_graphics,
	ds_info, ds_list_weapons, ds_controls, ds_list_buffs,
	ds_confirm, ds_stats, ds_list_achievements,
	ds_menu_keybinds, ds_menu_keybinds_p1, ds_menu_keybinds_p2, ds_menu_controllers];
//The page index values (must be in order)
menu_pages_index = [menu_page.main, menu_page.gamemodes, menu_page.settings, menu_page.audio, menu_page.graphics,
	menu_page.info, menu_page.list_weapons, menu_page.controls, menu_page.list_buffs,
	menu_page.confirm, menu_page.stats, menu_page.list_achievements,
	menu_page.keybinds, menu_page.keybinds_1, menu_page.keybinds_2, menu_page.keybinds_controller];
//Pages that are centered and have no input side
menu_pages_centered = [ds_menu_main, ds_gamemodes, ds_settings, ds_info, ds_list_weapons, ds_list_buffs, ds_controls, 
	ds_confirm, ds_list_achievements, ds_menu_keybinds];

//Ignore specific menu elements from being selected
menu_special = [menu_element_type.list_buffs, menu_element_type.list_weapons, menu_element_type.controls, menu_element_type.stats, menu_element_type.list_achievements];
var pos = RES_H - (RES_H / 8) - (RES_H / 16);
menu_special_start_y = [pos + (RES_H / 16), pos + (RES_H / 16), pos, noone, pos + (RES_H / 16)];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	for (var a = 0; a < array_length_1d(menu_special); a++) {
		var ds_grid = menu_pages[i];
		if (ds_grid[# 1, 0] == menu_special[a]) menu_option[i] = 1; //Default selection for each special page
		else menu_option[i] = 0; //Default selection for each page
	}
menu_option[page] = 0;

//Unfolding animation
unfolding = true;
for (var i = 0; i < ds_grid_height(menu_pages[menu_page.main]); i++)
	unfold[i] = 0; //Position multiplier of page text

if (global.gamemode_select)
	page = 1;
global.gamemode_select = false;