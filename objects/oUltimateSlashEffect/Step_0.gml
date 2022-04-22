/// @description  

if(instance_exists(owner) && owner != noone){
	with(owner){
		if(instance_exists(owner) && owner != noone){
			other.image_speed = owner.time_dialation;	
		}
	}

}

if(image_speed > 1)
	image_speed = 1;

if(image_index == image_number-1){
	instance_destroy();	
}
