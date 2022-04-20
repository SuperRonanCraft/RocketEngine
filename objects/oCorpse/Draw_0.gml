/// @description  


if ( (standing != noone || stuck) && timer > 0)
	timer--;
	
else
	timer -= 0.2;
	

if(timer <= 0 && !statue && !slimed)
	image_alpha = max(image_alpha - alpha_reduce, 0);


var _y = y;
if (animate && !moving)
	_y = _y + scMovementWave(-3, 3, animate_dur);
	
/*	
if(slice){
	shader_set(shSlice);	
}*/

if(ds_exists(playerMap, ds_type_map)){
	var char_info = playerMap[? PLAYER_MAP.CHARACTER_INFO];
	scPalleteSwapSet(char_info[? CHARACTER_MAP.PALETTE], char_info[? CHARACTER_MAP.PALETTE_INDEX]);
}

draw_sprite_ext(currentSprite,floor(animationVar),x,_y,facing,image_yscale,angle,color,image_alpha);


scPalleteSwapReset();
/*
if(slice){
	shader_reset();	
}*/




if (image_alpha <= 0 || ((statue || slimed) && timer <= 0))
	instance_destroy(id,true);
	

if (global.debug) {
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);
	//scDrawText(bbox_left, bbox_top - 10, "HSP: " + string(gravity_map[? GRAVITY_MAP.HSP]), noone, 0.3);
	//scDrawText(bbox_left, bbox_top - 25, "FACING: " + string(facing), noone, 0.3);
	/*scDrawText(bbox_left, bbox_top - 10, "Controller ID: " + string(controller), noone, 0.3);
	scDrawText(bbox_left, bbox_top - 25, "Controller In Use: " + string(controller_inuse), noone, 0.3);
	scDrawText(bbox_left, bbox_top - 40, "Controller Last Used: " + string(controller_lastused), noone, 0.3);*/
}