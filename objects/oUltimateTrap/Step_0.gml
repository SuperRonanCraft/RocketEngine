/// @desc 

if(owner != noone){
	if(!instance_exists(owner)){
		instance_destroy();
	}
}

if (!standing) { //Collision
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
	var istouchingy = false;
	for (var i = 0; i < ds_list_size(list); i++) {
		var touchingy = list[| i]; 
		if (touchingy != noone && touchingy.object_index != oSeperator) {
			istouchingy = true;
			if (trap_vsp > 0) //Falling
				y = floor(touchingy.bbox_top + (y - bbox_bottom) - offset);
			else if (trap_vsp < 0) //Going up
				y = ceil(touchingy.bbox_bottom + (y - bbox_top) + offset);
			trap_vsp = 0;
			break;
		}
	}
	ds_list_destroy(list);
	
	if (trap_vsp == 0 && istouchingy)
		trap_hsp = sign(trap_hsp) == 1 ? max(trap_hsp - 3, 0) : min(trap_hsp + 3, 0);
	
	if (trap_vsp == 0 && trap_hsp == 0 && istouchingy) {
		standing = true;
		image_index = 1;
	} else {
		x += trap_hsp;
		y += trap_vsp;
	}
}


if (standing){
	if (trapped == noone) {
		timer++;
		if (timer > uptime)
			instance_destroy();
	} else {
		timer_trapped++;
		if (timer_trapped > uptime_trapped)
			instance_destroy();
	}
}

/*
if(!instance_exists(trapped))
	exit;
with (trapped) {
	if (shootable_map[? SHOOTABLE_MAP.HEALTH] == other.trapped_hp) {
		player_map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.TRAPPED;
		other.x = x;
		other.y = bbox_bottom - (other.bbox_bottom - other.y);
	} else
		instance_destroy(other); //Player was shot, delete trap
}
