/// @desc a stage has begun
timer = STAGE_TIMER.DEFAULT;//global.stage_timer;
enum STAGE_TIMER {
	DEFAULT = 90, DEDICATED = 120, SCARED = 180
}
timer_current = timer;
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
instance_create_depth(0,0, depth, oCamera);
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

with (oPlayer)
	ds_list_add(other.p_list, self); //For every oPlayer, add players to the p_list

with (oMusic)
	event_user(1); //Start a new song
	
//Kick back timer
kick_timer = 10; //Time is seconds
kick_timer_abs = kick_timer * room_speed; //Absolute timer value
kick_timer_display = 3; //Display timer after this index is met