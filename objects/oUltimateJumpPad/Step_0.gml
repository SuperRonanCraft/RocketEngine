/// @desc fire rockets

if (!standing) {
	vsp += grv * owner.time_dialation;

	//Fall on floor
	var coly = false;
	var inst = instance_place(x, y + vsp, oWall);
	if (inst != noone && inst.object_index != oSeperator) {
		if (vsp > 0) //Falling
			y = floor(inst.bbox_top + (y - bbox_bottom) - 1);
		else if (vsp < 0) //Going up
			y = ceil(inst.bbox_bottom + (y - bbox_top) + 1);
		vsp = 0;
		standing = true;
	}
	
	y += vsp * owner.time_dialation;
	exit;
}

//COLLISION
if (ds_list_size(jump_list) > 0) {
	var list = ds_list_create();
	collision_rectangle_list(bbox_left - margin_x, bbox_top - margin_y, bbox_right + margin_x, 
		bbox_bottom + margin_y, oPlayer, true, false, list, false);
	if (ds_list_size(list) > 0) {
		var list_still = ds_list_create();
		for (var a = 0; a < ds_list_size(list); a++) {
			var inst = list[| a];
			var val = ds_list_find_index(jump_list, inst);
			if (val != -1)
				ds_list_add(list_still, inst);
		}
		ds_list_clear(jump_list);
		ds_list_copy(jump_list, list_still);
		ds_list_destroy(list_still);
	} else
		ds_list_clear(jump_list);
	ds_list_destroy(list);
}


//TIMER
if (timer <= 0) {
	image_alpha -= alpha_index;
	if (image_alpha <= 0)
		instance_destroy();
} else
	timer--;