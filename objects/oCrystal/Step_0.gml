/// @description  
switch (crystal) {
    case 0:
        sprite_index = sprite1;
        break;
    case 1:
        sprite_index = sprite2;
        break;
	case 2:
		sprite_index = sprite3;
		break;
}


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

