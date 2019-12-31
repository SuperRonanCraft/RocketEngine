/// @description  


if (timer > 0)
	timer--;
	
/*
else if (timer > -1)
	image_alpha = max(image_alpha - alpha_reduce, 0);
*/

var _y = y;
if (animate && !moving)
	_y = _y + scMovementWave(-3, 3, animate_dur);
	
draw_sprite_ext(sprite_index,image_index,x,_y,image_xscale,image_yscale,angle,c_white,1);

if (scaled && image_xscale != 1 || image_yscale != 1) {
	image_xscale = min(1, image_xscale + 0.05);
	image_yscale = image_xscale;
}


if (image_alpha <= 0)
	instance_destroy();
	

if (global.debug) {
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);
	//scDrawText(bbox_left, bbox_top - 10, "HSP: " + string(gravity_map[? GRAVITY_MAP.HSP]), noone, 0.3);
	//scDrawText(bbox_left, bbox_top - 25, "FACING: " + string(facing), noone, 0.3);
	/*scDrawText(bbox_left, bbox_top - 10, "Controller ID: " + string(controller), noone, 0.3);
	scDrawText(bbox_left, bbox_top - 25, "Controller In Use: " + string(controller_inuse), noone, 0.3);
	scDrawText(bbox_left, bbox_top - 40, "Controller Last Used: " + string(controller_lastused), noone, 0.3);*/
}