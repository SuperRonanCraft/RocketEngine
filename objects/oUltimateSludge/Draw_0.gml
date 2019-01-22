
if(!standing){
	sprite_index = sUltSludge_fly1;
	image_angle = darctan2(-sludge_vsp,sludge_hsp) - 90;
}
else{
	sprite_index = sUltSludge_floor1;
	image_angle = 0;
}


draw_self();