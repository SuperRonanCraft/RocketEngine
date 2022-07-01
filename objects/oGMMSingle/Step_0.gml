/// @desc Wait delay before starting stage, if allowed to play, call countdown delay every second
if (timer_enabled && !endgame)
	
	global.play = true;
		
	if (global.play && !endgame) {
		if (timer_room <= 0)
			timer_room = room_speed;
		else 
			timer_room--;
		if (timer_room == 0)
			event_user(0);
	}
//End of game event
if (endgame && !win) {
	event_user(2);
	if (endgame_delay <= 0)
		event_inherited(); //Navigate UI
	kick_timer_abs--;
	if (kick_timer_abs mod room_speed == 0)
		kick_timer--;
	if (kick_timer_abs <= 0 && kick_execute)
		SlideTransition(TRANS_MODE.GOTO, room);
}

else if(endgame && win){
	SlideTransition(TRANS_MODE.GOTO, room_next(room));
}

for (var i = 0; i < instance_number(pEntity); i++) {
    if(instance_find(pEntity,i).y > room_height*2) instance_find(pEntity,i).player_map[? PLAYER_MAP.ALIVE] = false;
}
/*
if(!instance_exists(mainPlayer)) exit;
if(mainPlayer.y > room_height *2) mainPlayer.player_map[? PLAYER_MAP.ALIVE] = false;
