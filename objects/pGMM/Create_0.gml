/// @desc a stage has begun

global.play = false;
global.gamemode = gamemode;

scStatsResetStage(false);

scStatsResetUnsaved();

timer = 90; //global.stage_timer;

scStatsLoadMode();

timer_current = timer;
timer_current_width = 0;
timer_room = 0;
wait_timer = 3; //The original timer
wait_timer_current = wait_timer; //Current timer index
wait_timer_current_abs = room_speed + 10; //When 0, with reset to room_speed and remove 1 from wait_timer
wait_timer_scale = 3;
wait_timer_text = string(wait_timer); //Current wait timer to display every second
wait_timer_go = "Go!" //Text when you can play
wait_timer_color = c_red;
//Kinda like pausing, but for specific objects like a player
global.play = false;
//Create a camera object for the screen shake and ability to manipulate viewport
instance_create_depth(0, 0, depth, oCamera);
//Endgame
endgame = false;
endgame_delay = 2 * room_speed; //Delay between ending the game and starting the end_game screen
//Winners and losers team
global.winner = noone;
global.loser = noone;
//If the winner/losers have been calculated
calculated = false;
tie = false;

//list of players in gamemode
p_list = ds_list_create();

with (oPlayer) {
	ds_list_add(other.p_list, self); //For every oPlayer, add players to the p_list
	scPlayerLoadModifiers(id); //Load modifiers
}

with (oMusicHandler)
	event_user(1); //Start a new song
	
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
	["REMATCH",		menu_element_type.script_runner,	scStageRestart, "Play again!"],
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