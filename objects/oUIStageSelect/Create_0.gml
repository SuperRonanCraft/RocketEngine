/// @description UI for stage select

//Allow Tips
global.play = false;

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
yy = RES_H / 6;
xx2 = RES_W - RES_W / 6;
yy2 = RES_H - RES_H / 16;

//Grab the gamemode we are setting up for
switch (room) {
	case r1v1Select: mode = global.gamemodes[GAMEMODE.ONEVONE]; break;
	case rvTargetSelect: mode = global.gamemodes[GAMEMODE.TARGETS]; break;
	case rKnockOutSelect: mode = global.gamemodes[GAMEMODE.KNOCKOUT]; break;
	case rSingleSelect: mode = global.gamemodes[GAMEMODE.SINGLE]; break;
	case rRumbleSelect: mode = global.gamemodes[GAMEMODE.RUMBLE]; break;
}

//Setup ui
event_inherited();

ds_menu_main = scUICreateMenuPage(
	["PLAY",		menu_element_type.script_runner,	scStageConfirm],
	//[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scStageBack],
	//[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scStageNext],
	["BACK",		menu_element_type.script_runner,	scUIExitToGamemodeSelect]
);
//Pages of the menu
menu_pages = [ds_menu_main];
//The page index values (must be in order)
menu_pages_index = [menu_page.main];

global.gamemode = type;
switch (type) {
	case GAMEMODE.ONEVONE:
		ds_menu_main = scUICreateMenuPage(
			["PLAY",		menu_element_type.script_runner,	scStageConfirm],
			[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scStageBack],
			[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scStageNext],
			["MODIFIERS",		menu_element_type.page_transfer,	menu_page.modes, "ALTER YOUR GAMEPLAY"],
			["BACK",		menu_element_type.script_runner,	scUIExitToGamemodeSelect]
		);

		ds_modes = scUICreateMenuPage(
			["HEALTH",		menu_element_type.shift,	["1", "5", "10", "20", "50", "100"],	"mode_1v1_health",	global.mode_1v1_health, "Be an angel, or a jerk!"],
			["TIMER",		menu_element_type.shift,	["30 sec", "60 sec", "90 sec", "3 min", "5 min"],	"mode_1v1_timer",	global.mode_1v1_timer, "Become a time master"],
			//["PICKUPS",		menu_element_type.shift,	["Disabled", "x1", "x10"],	"mode_1v1_pickups",	global.mode_1v1_pickups, "Unleash Mayhem!"],
			//["LOW GRAVITY",		menu_element_type.toggle,	noone,	"mode_1v1_lowgravity",	global.mode_1v1_lowgravity, "You are one with the ceiling"],
			["ULTIMATES",	menu_element_type.shift,	["Disabled", "x1 Charge", "x10 Charge"],	"mode_1v1_ultimates",	global.mode_1v1_ultimates, "The wombo combos!"],
			["WEAPONS",		menu_element_type.toggle,	noone,	"mode_1v1_weapon",	global.mode_1v1_weapon, "So, u wont be able to shoot..."],
			["PLAYERS",		menu_element_type.shift,	["Multi-Player", "Player vs. AI", "AI vs. AI"],	"mode_1v1_singleplayer",	global.mode_1v1_singleplayer, "Play with a friend or machine!"],
			//NAME, ELEMENT, ELEMENTS TO CHANGE, PRESET NAMES, PRESET VALUES, NEW VALUE, CURRENT VALUE
			["PRESETS",	menu_element_type.mass_toggle,	[0, 1, 2],	["Custom", "Classic", "Boss Battle", "No Ultimates", "One Shot Kill"],	
				[[2, 2, 1], [5, 4, 2], [2, 2, 0], [0, 0, 0]], "mode_1v1_preset", global.mode_1v1_preset],
			["BACK",		menu_element_type.page_transfer,	menu_page.main],
		);
		menu_pages = [ds_menu_main, ds_modes];
		menu_pages_index = [menu_page.main, menu_page.modes];
		break;
	case GAMEMODE.TARGETS:
		/*var rockets = 0;
		var roc = 0
		for (var i = WEAPON_ROCKET_TYPE.DEFAULT; i < WEAPON_ROCKET_TYPE.LENGHT; i++) {
			var list = scRocketGet(i);
			if (list[? ROCKET_MAP.ENABLED]) {
				rockets[roc] = list[? ROCKET_MAP.NAME];
				roc++;
			}
			ds_map_destroy(list);
		}*/
		ds_menu_main = scUICreateMenuPage(
			["PLAY",		menu_element_type.script_runner,	scStageConfirm],
			[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scStageBack],
			[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scStageNext],
			["MODIFIERS",		menu_element_type.page_transfer,	menu_page.modes, "ALTER YOUR GAMEPLAY"],
			["BACK",		menu_element_type.script_runner,	scUIExitToGamemodeSelect]
		);
		
		ds_modes = scUICreateMenuPage(
			["DIFFICULTY",		menu_element_type.shift,	["EASY", "MEDIUM", "HARD"],	"mode_targets_difficulty",	global.mode_targets_difficulty, "Less targets, more skill!"],
			["TIMER",			menu_element_type.shift,	["30 sec", "60 sec", "90 sec", "3 min", "5 min"],	"mode_targets_timer",	global.mode_targets_timer, "Become a time master"],
			//["ROCKET TYPE",		menu_element_type.shift,	rockets,	"mode_targets_rockettype",	global.mode_targets_rockettype, "Choose your weapon!"],
			["PRESET",	menu_element_type.mass_toggle,	[0, 1/*, 2*/],	["Custom", "Classic", "Never Miss", "Time Expert"],	
				[[0, 2, 1], [1, 3, 2], [2, 0, 5]], "mode_targets_preset", global.mode_targets_preset],
			["BACK",		menu_element_type.page_transfer,	menu_page.main],
		);
		menu_pages = [ds_menu_main, ds_modes];
		menu_pages_index = [menu_page.main, menu_page.modes];
		break;
	case GAMEMODE.KNOCKOUT:
		ds_menu_main = scUICreateMenuPage(
			["PLAY",		menu_element_type.script_runner,	scStageConfirm, "NO WALL KNOCKBACK, BEWARE!"],
			[["<< PREV",	menu_centered.left],		menu_element_type.script_runner,	scStageBack],
			[["NEXT >>",	menu_centered.right],		menu_element_type.script_runner,	scStageNext],
			["MODIFIERS",	menu_element_type.page_transfer,	menu_page.modes, "ALTER YOUR GAMEPLAY"],
			["BACK",		menu_element_type.script_runner,	scUIExitToGamemodeSelect]
		);

		ds_modes = scUICreateMenuPage(
			["HEALTH",		menu_element_type.shift,	["1", "2", "3", "5", "10"],	"mode_kb_health",	global.mode_kb_health, "Spawn kill!?"],
			["TIMER",		menu_element_type.shift,	["30 sec", "60 sec", "90 sec", "3 min", "5 min"],	"mode_kb_timer",	global.mode_kb_timer, "Become a time master"],
			//["PICKUPS",		menu_element_type.shift,	["Disabled", "x1", "x10"],	"mode_kb_pickups",	global.mode_kb_pickups, "Unleash Mayhem!"],
			//["LOW GRAVITY",		menu_element_type.toggle,	noone,	"mode_1v1_lowgravity",	global.mode_1v1_lowgravity, "You are one with the ceiling"],
			["ULTIMATES",	menu_element_type.shift,	["Disabled", "x1 Charge", "x10 Charge"],	"mode_kb_ultimates",	global.mode_kb_ultimates, "The wombo combos!"],
			//NAME, ELEMENT, ELEMENTS TO CHANGE, PRESET NAMES, PRESET VALUES, NEW VALUE, CURRENT VALUE
			["PRESETS",	menu_element_type.mass_toggle,	[0, 1, 2],	["Custom", "Classic", "Boss Battle", "No Ultimates", "One Shot Kill"],	
				[[2, 2, 1], [4, 4, 2], [2, 2, 0], [0, 0, 0]], "mode_kb_preset", global.mode_kb_preset],
			["BACK",		menu_element_type.page_transfer,	menu_page.main],
		);
		menu_pages = [ds_menu_main, ds_modes];
		menu_pages_index = [menu_page.main, menu_page.modes];
		break;
	case GAMEMODE.SINGLE:
		if (scStatsGetType(STATISTICS_TYPE.VALUE_GAMEMODE, STATISTICS_GAMEMODE.GM_SINGLE_LIVES, type) <= 0 
			|| scStatsGetType(STATISTICS_TYPE.VALUE_GAMEMODE, STATISTICS_GAMEMODE.GM_SINGLE_CHECKPOINT, type) == noone)
			ds_menu_main = scUICreateMenuPage(
				["NEW GAME",	menu_element_type.script_runner,	scStageSingle_NewGame, "Start up a new game!"],
				["BACK",		menu_element_type.script_runner,	scUIExitToGamemodeSelect]
			);
		else
			ds_menu_main = scUICreateMenuPage(
				["CONTINUE",	menu_element_type.script_runner,	scStageSingle_Continue, "Pickup where you left off!"],
				["NEW GAME",	menu_element_type.script_runner,	scStageSingle_NewGame, "Start up a new game!"],
				["BACK",		menu_element_type.script_runner,	scUIExitToGamemodeSelect]
			);
		menu_pages = [ds_menu_main];
		menu_pages_index = [menu_page.main];
		break;
	case GAMEMODE.RUMBLE:
		ds_menu_main = scUICreateMenuPage(
			["PLAY",		menu_element_type.script_runner,	scStageConfirm],
			[["<< PREV", menu_centered.left],		menu_element_type.script_runner,	scStageBack],
			[["NEXT >>", menu_centered.right],		menu_element_type.script_runner,	scStageNext],
			["MODIFIERS",		menu_element_type.page_transfer,	menu_page.modes, "ALTER YOUR GAMEPLAY"],
			["BACK",		menu_element_type.script_runner,	scUIExitToGamemodeSelect]
		);

		ds_modes = scUICreateMenuPage(
			["HEALTH",		menu_element_type.shift,	["1", "5", "10", "20", "50", "100"],	"mode_rumble_health",	global.mode_rumble_health, "Be an angel, or a jerk!"],
			["TIMER",		menu_element_type.shift,	["30 sec", "60 sec", "90 sec", "3 min", "5 min"],	"mode_rumble_timer",	global.mode_rumble_timer, "Become a time master"],
			//["PICKUPS",		menu_element_type.shift,	["Disabled", "x1", "x10"],	"mode_1v1_pickups",	global.mode_1v1_pickups, "Unleash Mayhem!"],
			//["LOW GRAVITY",		menu_element_type.toggle,	noone,	"mode_1v1_lowgravity",	global.mode_1v1_lowgravity, "You are one with the ceiling"],
			["ULTIMATES",	menu_element_type.shift,	["Disabled", "x1 Charge", "x10 Charge"],	"mode_rumble_ultimates",	global.mode_rumble_ultimates, "The wombo combos!"],
			//["WEAPONS",		menu_element_type.toggle,	noone,	"mode_1v1_weapon",	global.mode_1v1_weapon, "So, u wont be able to shoot..."],
			["PLAYERS",		menu_element_type.shift,	["Multi-Player", "Player vs. AI", "AI vs. AI"],	"mode_rumble_singleplayer",	global.mode_rumble_singleplayer, "Play with a friend or machine!"],
			//NAME, ELEMENT, ELEMENTS TO CHANGE, PRESET NAMES, PRESET VALUES, NEW VALUE, CURRENT VALUE
			["PRESETS",	menu_element_type.mass_toggle,	[0, 1, 2],	["Custom", "Classic", "Boss Battle", "No Ultimates", "One Shot Kill"],	
				[[2, 2, 1], [5, 4, 2], [2, 2, 0], [0, 0, 0]], "mode_rumble_preset", global.mode_rumble_preset],
			["BACK",		menu_element_type.page_transfer,	menu_page.main],
		);
		menu_pages = [ds_menu_main, ds_modes];
		menu_pages_index = [menu_page.main, menu_page.modes];
		break;
}

//Pages that are centered and have no input side
menu_pages_centered = [ds_menu_main];

for (var i = 0; i < array_length(menu_pages); i++)
	menu_option[i] = -1;

//Disabled unfolding
unfolding = false;