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
yy = RES_H / 8;
xx2 = RES_W / 6;
yy2 = RES_H - RES_H / 16;

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
			["HEALTH",		menu_element_type.shift,	["x1/10", "x1/2", "x1", "x2", "x5", "x10"],	"mode_1v1_health",	global.mode_1v1_health, "Based off 10 hp"],
			["TIME",		menu_element_type.shift,	["30 sec", "60 sec", "90 sec", "3 min", "5 min"],	"mode_1v1_timer",	global.mode_1v1_timer],
			["DROPS",		menu_element_type.shift,	["x0", "x1", "x10"],	"mode_1v1_drops",	global.mode_1v1_drops, "Or better said, pickup random stuff"],
			["ROCKETS",		menu_element_type.toggle,	noone,	"mode_1v1_rockets",	global.mode_1v1_rockets, "Faster ultimate charge!"],
			["ULTIMATES",	menu_element_type.toggle,	noone,	"mode_1v1_ultimates",	global.mode_1v1_ultimates, "The fun mode"],
			//NAME, ELEMENT, ELEMENTS TO CHANGE, PRESET NAMES, PRESET VALUES, NEW VALUE, CURRENT VALUE
			["PRESET",	menu_element_type.mass_toggle,	[0, 1, 2, 3, 4],	["Custom", "Classic", "Boss Battle", "No Ultimates", "One Shot Kill"],	
			[[2, 2, 1, true, true], [5, 4, 2, true, true], [2, 2, 2, true, false], [0, 0, 1, true, false]], 1, 1],
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
			["DIFFICULTY",		menu_element_type.shift,	["EASY", "MEDIUM", "HARD"],	"mode_targets_difficulty",	global.mode_targets_difficulty, "Less targets the harder it gets"],
			["TIME",			menu_element_type.shift,	["30 sec", "60 sec", "90 sec", "3 min", "5 min"],	"mode_targets_timer",	global.mode_targets_timer],
			["ROCKET TYPE",		menu_element_type.shift,	rockets,	"mode_targets_rockettype",	global.mode_targets_rockettype, "Your sword master"],
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