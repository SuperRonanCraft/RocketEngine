/// @description  


if (owner != noone && sprite_index != sprite_proj){
	x = owner.x;
	y = owner.y;
}
trueTimer--;

if (sprite_index == sprite_proj && image_index == image_number - 1){
	if (ds_list_empty(confirmList)){
		with (owner)
			scComboMiss();		
	}	
	instance_destroy();	
} else if (sprite_index != sprite_proj && image_index == image_number - 1) {
	sprite_index = sprite_proj;
	image_index = 0;
	depth -= 2;
	hsp += 28 * image_xscale;
}

if (trueTimer == 0){
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

x += hsp;