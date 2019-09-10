/// @description  


if(owner != noone){
	x = owner.x;
	y = owner.y;
}



timer = timer-(1 * owner.time_dialation);
trueTimer--;

if(timer <= 0 && image_index == image_number-1){
	instance_destroy();	
}

if(trueTimer == 0){
	trueTimer = -1;
	scScreenShake(25,5);
	owner.time_dialation += time_dialation_adjust;
	if(oldOwner != noone){
		oldOwner.time_dialation += oldOwner_time_dialation_adjust;
	}
}
else if(trueTimer > 0){
	owner.time_dialation = 0;
	if(oldOwner != noone){
		oldOwner.time_dialation = 0;	
	}
}

image_speed = owner.time_dialation;

if(image_index == image_number-1){
	image_speed = 0;
}

