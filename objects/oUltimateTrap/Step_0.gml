/// @desc 

if (!standing) {
	trap_vsp += trap_grv;
	var offset = 1;
	var list = ds_list_create();
	instance_place_list(x + trap_hsp, y, oWall, list, false);
	for (var i = 0; i < ds_list_size(list); i++) {
		var touchingx = list[| i];
		if (touchingx != noone && touchingx.object_index != oSeperator) {  
			//Normal wall collision
			if (trap_hsp > 0) { //Going Right
				x = floor(touchingx.bbox_left + (x - bbox_right) - offset);
			} else if (trap_hsp < 0)//Going Left
				x = ceil(touchingx.bbox_right + (x - bbox_left) + offset);
			trap_hsp = 0;
			break;
		}
	}
	ds_list_clear(list);
	instance_place_list(x, y + trap_vsp, oWall, list, false);
	for (var i = 0; i < ds_list_size(list); i++) {
		var touchingy = list[| i]; 
		if (touchingy != noone && touchingy.object_index != oSeperator) {
			if (trap_vsp > 0) //Falling
				y = floor(touchingy.bbox_top + (y - bbox_bottom) - offset);
			else if (trap_vsp < 0) //Going up
				y = ceil(touchingy.bbox_bottom + (y - bbox_top) + offset);
			trap_vsp = 0;
			break;
		}
	}
	ds_list_destroy(list);
	
	if (trap_vsp == 0)
		trap_hsp -= sign(trap_hsp) * 1;
	
	if (trap_vsp == 0 && trap_hsp == 0)
		standing = true;
	else {
		x += trap_hsp;
		y += trap_vsp;
	}
}

with (trapped) {
	if (hp == other.trapped_hp) {
		playerState = PLAYERSTATE.TRAPPED;
		other.x = x;
		other.y = bbox_bottom - (other.bbox_bottom - other.y);
	} else
		with (other)
			instance_destroy();
}

if (standing) {
	timer++;
	if (timer > trap_uptime)
		instance_destroy();
}