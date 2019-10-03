/// @description  


if(owner != noone){
	x = owner.x;
	y = owner.y;
}



timer = timer-(owner.time_dialation);
trueTimer--;


for (var i = 0; i < 5; i++) {
    // Make several clouds a tick
	var smokeCloud = instance_create_depth(irandom_range(bbox_left,bbox_right),irandom_range(bbox_top,bbox_bottom),depth-1,oDustCloud);
	smokeCloud.hsp = irandom_range(-2,2);
	smokeCloud.vsp = irandom_range(-2,2);
	smokeCloud.timer = irandom_range(180,245);
	smokeCloud.maxtimer = smokeCloud.timer;
	smokeCloud.owner = owner;
	smokeCloud.image_speed = random_range(0.5,1);
	//smokeCloud.image_xscale = irandom_range(1,3);
	//smokeCloud.image_yscale = smokeCloud.image_xscale;
}



if(timer <= 0 && image_index == image_number-1){
	if(ds_list_empty(confirmList)){
		with (owner)
			scComboMiss();		
	}
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

