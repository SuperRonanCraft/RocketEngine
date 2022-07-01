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
	
	
if(slice){
	
	var uvs = sprite_get_uvs(currentSprite, floor(animationVar));
	var uv_w = uvs[2] - uvs[0];
	var uv_h = uvs[3] - uvs[1];
	uv_dimensions[0] = uv_w;
	uv_dimensions[1] = uv_h;
	uv_center[0] = 0.5 * uv_w + uvs[0];
	uv_center[1] = 0.5 * uv_h + uvs[1];
	//draw_text(bbox_right+50, bbox_top, string(sliceAngle));
	//shader_set(shSlice);	
	//shader_set_uniform_f_array(u_uv_center, uv_center);
	//shader_set_uniform_f_array(u_uv_dimensions, uv_dimensions);
	sliceAngle += 1;
	//shader_set_uniform_f(u_sliceAngle, sliceAngle);
}


if(ds_exists(playerMap, ds_type_map)){
	var char_info = playerMap[? PLAYER_MAP.CHARACTER_INFO];
	scPalleteSwapSet(char_info[? CHARACTER_MAP.PALETTE], char_info[? CHARACTER_MAP.PALETTE_INDEX]);
}

draw_sprite_ext(currentSprite,floor(animationVar),x,_y,facing,image_yscale,angle,color,image_alpha);


scPalleteSwapReset();

if(shocked){
	scDrawLightning(irandom_range(x-10,x+10), irandom_range(y-5, y+5), irandom_range(x-20, x+20), irandom_range(y-10,  y+10), max(0,10-timer), c_white);	
	
}


if(slice){
	//shader_reset();	
}




if (image_alpha <= 0 || ((statue || slimed || shocked) && timer <= 0))
	instance_destroy(id,true);
	

if (global.debug) {
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);
	//scDrawText(bbox_left, bbox_top - 10, "HSP: " + string(gravity_map[? GRAVITY_MAP.HSP]), noone, 0.3);
	//scDrawText(bbox_left, bbox_top - 25, "FACING: " + string(facing), noone, 0.3);
	/*scDrawText(bbox_left, bbox_top - 10, "Controller ID: " + string(controller), noone, 0.3);
	scDrawText(bbox_left, bbox_top - 25, "Controller In Use: " + string(controller_inuse), noone, 0.3);
	scDrawText(bbox_left, bbox_top - 40, "Controller Last Used: " + string(controller_lastused), noone, 0.3);*/
}