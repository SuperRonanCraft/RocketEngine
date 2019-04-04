/// @description  
draw_self();

if(type == MISCEFFECT.SMOKE && image_index == image_number-1){
	instance_destroy();	
}
else if(type == MISCEFFECT.MIST){
	sprite_index = sUltFrostyMist;
	image_alpha -= 0.05;
	xsp += random_range(-0.5,0.5);
	
	x += xsp;
	
	if(image_alpha <= 0.2){
		instance_destroy();	
	}
}