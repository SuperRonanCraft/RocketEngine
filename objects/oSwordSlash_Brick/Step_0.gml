/// @description  


if(owner != noone){
	x = owner.x;
	y = owner.y;
}

var playerMap = owner.player_map;

timer = timer-(owner.time_dialation);
trueTimer--;

if((timer <= 0 && image_index == image_number-1) || playerMap[?PLAYER_MAP.PLAYER_STATE] != PLAYERSTATE.ABILITYCHANNEL){
	
	if(playerMap[?PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.ABILITYCHANNEL)
		playerMap[?PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.NORMAL;
	
	instance_destroy();	
}

else if(timer == 5){
	var brickBall = instance_create_depth(x,y-10,depth-1,oBrickBall);
	brickBall.hsp = 13*image_xscale;
	brickBall.vsp = -5;
	brickBall.owner = owner;
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

