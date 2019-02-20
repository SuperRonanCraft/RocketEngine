if (!exit_created) {
	if (timer <= 0) {
		exit_created = true;
		exit_x = owner.x;
		exit_y = owner.y;
	} else {
		timer--;
	}
	image_alpha = min(image_alpha + alpha_change, max_alpha);
} else if (portal_timer > 0) {
	portal_timer--;
	portal_alpha = min(portal_alpha + alpha_change, max_alpha);
	image_alpha = min(image_alpha + alpha_change, max_alpha);
	
	//Collision
	
	var index = 0;
	for (var i = index; i < ds_list_size(teleported); i++) {
		var ary = teleported[| index];
		var p = ary[0];
		var from = ary[1];
		var margin = 50;
		if (!from && (p.x > bbox_left && p.x < bbox_right) && (p.y > bbox_top && p.y < bbox_bottom))
			index++
		else if (from && (p.x > exit_x - (sprite_width / 2) - margin && p.x < exit_x + (sprite_width / 2) + margin)
				&& (p.y > exit_y - (sprite_height / 2) - margin && p.y < exit_y + (sprite_height / 2) + margin))
			index++;
		else
			ds_list_delete(teleported, index);
			
	}
	
	var listentry = ds_list_create();
	var listexit = ds_list_create();
	var teleport = ds_list_create();
	collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, oPlayer, false, false, listentry, false);
	collision_rectangle_list(exit_x - (sprite_width / 2), exit_y - (sprite_height / 2), exit_x + (sprite_width / 2), exit_y + (sprite_height / 2), oPlayer, false, false, listexit, false);
		
	//EXTRY
	for (var a = 0; a < ds_list_size(listentry); a++) {
		var found = false;
		var p = listentry[| a];
		for (var i = 0; i < ds_list_size(teleported); i++) {
			var obj = teleported[| i];
			if (p.object_index == obj[0].object_index) {
				found = true;
				break;
			}
		}
		if (!found)
			ds_list_add(teleport, [p, true]);
	}
		
	//EXIT
	for (var a = 0; a < ds_list_size(listexit); a++) {
		var found = false;
		var p = listexit[| a];
		for (var i = 0; i < ds_list_size(teleported); i++) {
			var obj = teleported[| i];
			if (p.object_index == obj[0].object_index) {
				found = true;
				break;
			}
		}
		if (!found)
			ds_list_add(teleport, [p, false]);
	}
	
	//TELEPORT
	for (var i = 0; i < ds_list_size(teleport); i++) {
		var ary = teleport[| i];
		var p = ary[0];
		var from = ary[1];
		ds_list_add(teleported, [p, from]);
		if (from) {
			p.x = exit_x;
			p.y = exit_y;
		} else {
			p.x = x;
			p.y = y;
		}
	}
	ds_list_destroy(listentry);
	ds_list_destroy(listexit);
	ds_list_destroy(teleport);
	
} else {
	portal_alpha = max(portal_alpha - alpha_change, 0);
	image_alpha = max(image_alpha - alpha_change, 0);
	if (portal_alpha == 0 && image_alpha == 0)
		instance_destroy();
}