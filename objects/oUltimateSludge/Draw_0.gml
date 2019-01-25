
sprite_index = sludge_sprite_floor;

if (!standing) {
	sprite_index = sludge_sprite_fly;
	image_angle = darctan2(-sludge_vsp, sludge_hsp) - 90;
} else if (wallStick == 1 && !ceilingStick) {
	image_angle = 90;
} else if (wallStick == -1 && !ceilingStick) {
	image_angle = 270;	
} else if (ceilingStick) {
	image_angle = 180;
} else {
	image_angle = 0;	
}

draw_self();