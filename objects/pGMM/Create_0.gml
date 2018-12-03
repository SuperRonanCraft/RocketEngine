/// @desc a stage has begun
timer = STAGE_TIMER.DEFAULT;//global.stage_timer;
enum STAGE_TIMER {
	DEFAULT = 90, DEDICATED = 120, SCARED = 180
}
timer_current = timer;
timer_room = 0;
wait_timer = 3;
wait_timer_current = room_speed + 10;
wait_timer_scale = 1;
//Kinda like pausing, but for specific objects like a player
global.play = false;
//Create a camera object for the screen shake and ability to manipulate viewport
instance_create_depth(0,0, depth, oCamera);
//Endgame
endgame = false;
endgame_delay = 2 * room_speed;
//Winners and losers list
global.winner = noone;
global.loser = noone;
//If the winner/losers have been calculated
calculated = false;
tie = false;

//list of players in gamemode
p_list = ds_list_create();

with (oPlayer)
	ds_list_add(other.p_list, id);
with (oMusic)
	event_user(1);