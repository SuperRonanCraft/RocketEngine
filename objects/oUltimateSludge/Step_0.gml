/// @desc move sludge

if (!standing) { //Collision
	sludge_vsp += sludge_grv;
	var offset = 1;
	var list = ds_list_create();
	instance_place_list(x + sludge_hsp, y, oWall, list, false);
	for (var i = 0; i < ds_list_size(list); i++) {
		var touchingx = list[| i];
		if (touchingx != noone && touchingx.object_index != oSeperator) {  
			//Normal wall collision
			if (sludge_hsp > 0) { //Going Right
				x = floor(touchingx.bbox_left + (x - bbox_right) - offset);
			} else if (sludge_hsp < 0)//Going Left
				x = ceil(touchingx.bbox_right + (x - bbox_left) + offset);
			sludge_hsp = 0;
			break;
		}
	}
	ds_list_clear(list);
	instance_place_list(x, y + sludge_vsp, oWall, list, false);
	var istouchingy = false;
	for (var i = 0; i < ds_list_size(list); i++) {
		var touchingy = list[| i]; 
		if (touchingy != noone && touchingy.object_index != oSeperator) {
			istouchingy = true;
			if (sludge_vsp > 0) //Falling
				y = floor(touchingy.bbox_top + (y - bbox_bottom) - offset);
			else if (sludge_vsp < 0) //Going up
				y = ceil(touchingy.bbox_bottom + (y - bbox_top) + offset);
			sludge_vsp = 0;
			break;
		}
	}
	ds_list_destroy(list);
	
	if (sludge_vsp == 0 && istouchingy)
		sludge_hsp = sign(sludge_hsp) == 1 ? max(sludge_hsp - 3, 0) : min(sludge_hsp + 3, 0);
	
	if (sludge_vsp == 0 && sludge_hsp == 0 && istouchingy) {
		standing = true;
		image_index = 1;
	} else {
		x += sludge_hsp;
		y += sludge_vsp;
	}
}

if (standing)
	if (sludge_timer > sludge_despawn) {
		image_alpha -= 0.1;
		if (image_alpha <= 0)
			instance_destroy();
	} else
		sludge_timer++;