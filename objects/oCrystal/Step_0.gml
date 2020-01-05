/// @description  
if(owner != noone){
	if(!instance_exists(owner)){
		instance_destroy()	
		exit;
	}
	else{	
		x = owner.x + startX;
		y = owner.y + startY;
	}
	
}

if(image_index >= image_number-1){
	image_index = image_number-1;	
	image_speed = 0;
}

