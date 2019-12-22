/// @desc Single Player gamemode started

event_inherited();

with (instance_create_depth(0, 0, depth, oCameraFollow))
	follow = oPlayer;

global.play = true;

player_checkpoint = 0; //Index of checkpoint
player_hp = 0;
player_rocket = noone;
/*
if (!scStatsGetType(STATISTICS_TYPE.VALUE_GAMEMODE, STATISTICS_GAMEMODE.GM_SINGLE_NEWGAME, gamemode))
	with (oPlayer) {
		shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = scStatsGetType(STATISTICS_TYPE.VALUE_GAMEMODE, STATISTICS_GAMEMODE.GM_SINGLE_LIVES, other.gamemode);
		scRocketChange(scStatsGetType(STATISTICS_TYPE.VALUE_GAMEMODE, STATISTICS_GAMEMODE.GM_SINGLE_ROCKET, other.gamemode));
		var check_point_id = scStatsGetType(STATISTICS_TYPE.VALUE_GAMEMODE, STATISTICS_GAMEMODE.GM_SINGLE_CHECKPOINT, other.gamemode);
		var check_point = scCheckpointGet(check_point_id);
		if (check_point != noone) {
			x = check_point.x;
			y = check_point.y - 100;
			other.player_checkpoint = check_point_id;
		}
	}

scStatsSet(gamemode, [STATISTICS_GAMEMODE.GM_SINGLE_NEWGAME], [false]);
*/	
	
//--------------
//User Interface
//--------------

ds_menu_main = scUICreateMenuPage(
	["RESTART",		menu_element_type.script_runner,	scStageRestart, "Play again!"],
	["EXIT",		menu_element_type.goto_room,	global.gamemodeSRoom[gamemode], "Choose a new stage"],
);

//Pages of the menu
menu_pages = [ds_menu_main];
//The page index values (must be in order)
menu_pages_index = [menu_page.main];
//Pages that are centered and have no input side
menu_pages_centered = [ds_menu_main];

for (var i = 0; i < array_length_1d(menu_pages); i++)
	menu_option[i] = 0;

start_y_default = RES_H - RES_H / 4;

//Disabled unfolding
unfolding = false;

//Team Declaration
global.teamEnemy = ds_list_create();
global.teamPlayer = ds_list_create();
global.teamNone = ds_list_create();

//Apply Modifiers
event_user(10);