/// @description UI for stage select

//Setup Camera
cam = view_camera[0];
view_w = camera_get_view_width(cam);
view_h = camera_get_view_height(cam);
xTo = xstart;
yTo = ystart;

//Stage setup
stages = 0; //Setup in room start
stage_on = 0;
stage_on_current = stage_on;

xx = RES_W / 2;
yy = RES_H / 4;

//Grab the gamemode we are setting up for
switch (room) {
	case r1v1Select: global.gamemode = global.gamemodes[GAMEMODE.ONEVONE]; break;
	case rvTargetSelect: global.gamemode = global.gamemodes[GAMEMODE.TARGETS]; break;
	case rKnockOutSelect: global.gamemode = global.gamemodes[GAMEMODE.KNOCKOUT]; break;
	case rNukemSelect: global.gamemode = global.gamemodes[GAMEMODE.NUKED]; break;
}

//Setup ui
event_inherited();

ds_menu_main = scUICreateMenuPage(
	["PLAY",		menu_element_type.script_runner,	scStageConfirm],
	[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scStageBack],
	[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scStageNext],
	["BACK",		menu_element_type.script_runner,	scUIExitToTitle]
);
//Pages of the menu
menu_pages = [ds_menu_main];
//The page index values (must be in order)
menu_pages_index = [menu_page.main];
switch (type) {
	case GAMEMODE.ONEVONE:
		ds_menu_main = scUICreateMenuPage(
			["PLAY",		menu_element_type.script_runner,	scStageConfirm],
			[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scStageBack],
			[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scStageNext],
			["MODIFERS",		menu_element_type.page_transfer,	menu_page.modes],
			["BACK",		menu_element_type.script_runner,	scUIExitToTitle]
		);

		ds_modes = scUICreateMenuPage(
			["Health",		menu_element_type.shift,	["x1", "x2", "x5", "x10"],	"mode_1v1_extrahealth",	global.mode_1v1_extrahealth],
			["Time",		menu_element_type.shift,	["30 sec", "60 sec", "90 sec", "3 min", "5 min"],	"mode_1v1_timer",	global.mode_1v1_timer],
			["Ultimates",	menu_element_type.toggle,	noone,	"mode_1v1_ultimates",	global.mode_1v1_ultimates],
			["Extra Drops",	menu_element_type.toggle,	noone,	"mode_1v1_extradrops",	global.mode_1v1_extradrops],
			["BACK",		menu_element_type.page_transfer,	menu_page.main],
		);
		menu_pages = [ds_menu_main, ds_modes];
		menu_pages_index = [menu_page.main, menu_page.modes];
		break;
	case GAMEMODE.TARGETS:
		var rockets = 0;
		var roc = 0
		for (var i = ROCKET.DEFAULT; i < ROCKET.LENGHT; i++) {
			var list = scRocketGet(i);
			rockets[roc] = list[? ROCKET_MAP.NAME];
			ds_map_destroy(list);
			roc++;
		}
		ds_menu_main = scUICreateMenuPage(
			["PLAY",		menu_element_type.script_runner,	scStageConfirm],
			[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scStageBack],
			[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scStageNext],
			["MODIFERS",		menu_element_type.page_transfer,	menu_page.modes],
			["BACK",		menu_element_type.script_runner,	scUIExitToTitle]
		);
		
		ds_modes = scUICreateMenuPage(
			["DIFFICULTY",		menu_element_type.shift,	["EASY", "MEDIUM", "HARD"],	"mode_targets_difficulty",	global.mode_targets_difficulty],
			["ROCKET",		menu_element_type.shift,	rockets,	"mode_targets_rocket",	global.mode_targets_rocket],
			["BACK",		menu_element_type.page_transfer,	menu_page.main],
		);
		menu_pages = [ds_menu_main, ds_modes];
		menu_pages_index = [menu_page.main, menu_page.modes];
		break;
	case GAMEMODE.KNOCKOUT:
	case GAMEMODE.NUKED:
		break;
}

//Pages that are centered and have no input side
menu_pages_centered = [ds_menu_main];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = 0;

//Disabled unfolding
unfolding = false;