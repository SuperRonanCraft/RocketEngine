/// @description Insert description here
// You can write your code in this editor

stages = 0;
stage_on = 0;
stage_on_current = stage_on;
//Mouse movement
mouse_moving = false;
mouse_y_gui = 0;

switch (room) {
	case r1v1Select: global.gamemode = global.gamemodes[GAMEMODE.ONEVONE]; break;
	case rvTargetSelect: global.gamemode = global.gamemodes[GAMEMODE.TARGETS]; break;
	case rKnockOutSelect: global.gamemode = global.gamemodes[GAMEMODE.KNOCKOUT]; break;
	case rNukemSelect: global.gamemode = global.gamemodes[GAMEMODE.NUKED]; break;
}

xx = RES_W / 2;
yy = RES_H / 4;


//Load ui stuff
event_inherited();

ds_menu_main = scUICreateMenuPage(
	["CONFIRM",		menu_element_type.script_runner,	scUIResumeGame],
	["PREV",		menu_element_type.multiselect,		menu_page.settings],
);

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