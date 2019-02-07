/// @desc Single Player gamemode started

global.gamemode = gamemode;

with (instance_create_depth(0, 0, depth, oCameraFollow))
	follow = oPlayer;

with (oMusic)
	event_user(1); //Start a new song

//Endgame
endgame = false;
endgame_delay = 2 * room_speed; //Delay between ending the game and starting the end_game screen

//Kick back timer
kick_timer = 10; //Time is seconds
kick_timer_abs = kick_timer * room_speed; //Absolute timer value
kick_timer_display = 3; //Display timer after this index is met
kick_execute = true; //Leave the game after timer reaches 0
	
//--------------
//User Interface
//--------------

event_inherited();

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
