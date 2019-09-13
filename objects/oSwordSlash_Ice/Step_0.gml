/// @description  


if(owner != noone){
	x = owner.x;
	y = owner.y;
}



timer = timer-(owner.time_dialation);
trueTimer--;

if(timer <= 0 && image_index == image_number-1){
	instance_destroy();	
}

if(trueTimer == 0){
	trueTimer = -1;
	scScreenShake(25,5);
	//owner.time_dialation += 1;
	show_debug_message(owner.time_dialation);
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

