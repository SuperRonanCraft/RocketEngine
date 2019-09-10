/// @description  


if(owner != noone){
	x = owner.x;
	y = owner.y;
}


timer--;

if(timer <= 0 && image_speed == 0){
	instance_destroy();	
}

if(image_index == image_number-1){
	image_speed = 0;
}

