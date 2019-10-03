/// @description  


if(owner != noone){
	x = owner.x;
	y = owner.y;
}



timer = timer-(owner.time_dialation);


owner.hsp_move += (owner.facing*20);
owner.vsp_move = 0;
trueTimer--;

var playerMap = owner.player_map;


if((timer <= 0 && image_index == image_number-1) || playerMap[?PLAYER_MAP.PLAYER_STATE] != PLAYERSTATE.ABILITYCHANNEL){
	if(ds_list_empty(confirmList)){
		with (owner)
			scComboMiss();		
	}
	if(playerMap[?PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.ABILITYCHANNEL)
		playerMap[?PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.NORMAL;
	
	instance_destroy();	
}

if(trueTimer == 0){
	trueTimer = -1;
	scScreenShake(25,5);
	//owner.time_dialation += 1;
	//show_debug_message(owner.time_dialation);
	if(oldOwner != noone){
		//oldOwner.time_dialation += oldOwner_time_dialation_adjust;
	}
}
else if(trueTimer == 4){
	owner.time_dialation = 0;
	if(oldOwner != noone){
		oldOwner.time_dialation = 0;	
	}
}

image_speed = owner.time_dialation;

if(image_speed > 1)
	image_speed = 1;

if(image_index == image_number-1){
	image_speed = 0;
}

