
sprite_index = sUltSludge_floor1;

if(!standing){
	sprite_index = sUltSludge_fly1;
	image_angle = darctan2(-sludge_vsp,sludge_hsp) - 90;
}
else if(wallStick == 1 && !ceilingStick){
	image_angle = 90;
}
else if(wallStick == -1 && !celingStick){
	image_angle = 270;	
}
else if(ceilingStick){
	image_angle = 180;
}
else{
	image_angle = 0;	
}


draw_self();