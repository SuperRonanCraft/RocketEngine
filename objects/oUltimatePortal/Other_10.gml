/// @desc collision event
if (!global.play) exit;

for (var e = 0; e < 2; e++) {
	var inst = e == 0 ? oPlayer : oRocket;
	var listentry = ds_list_create();
	var listexit = ds_list_create();
	var teleport = ds_list_create();
	var removelist = ds_list_create();
	
//IGNORE BOX
	
	//ENTRY AND EXIT
	var margx = marginx, margy = marginy;
	collision_rectangle_list(x - margx, y - margy, x + margx, y + margy, inst, false, false, listentry, false);
	collision_rectangle_list(exit_x - margx, exit_y - margy, exit_x + margx, exit_y + margy, inst, false, false, listexit, false);
	
	for (var i = 0; i < ds_list_size(listexit); i++)
		ds_list_add(listentry, listexit[| i])
	
	for (var a = 0; a < ds_list_size(teleported); a++) {
		var found = false;
		var ary = teleported[| a];
		var p = ary[0];
		for (var i = 0; i < ds_list_size(listentry); i++) {
			var pl = listentry[| i];
			if (p == pl) {
				found = true;
				break;
			}
		}
		if (!found)
			ds_list_add(removelist, p);
	}
	
	//Delete ignored
	var index = 0;
	for (var i = 0; i < ds_list_size(removelist); i++) {
		var p = removelist[| i];
		var found = false;
		for (var a = 0; a < ds_list_size(teleported); a++) {
			var ary = teleported[| a];
			var obj = ary[0];
			if (!instance_exists(obj) || (obj.object_index == inst && obj == p)) {
				ds_list_delete(teleported, index);
				found = true;
				break;
			}
		}
		if (!found)
			index++;
	}
	ds_list_destroy(removelist);
	ds_list_clear(listentry);
	ds_list_clear(listexit);
	
//TELEPORT BOX
	
	var margx = marginx / 4, margy = marginy / 4;

	collision_rectangle_list(x - margx, y - margy, x + margx, y + margy, inst, false, false, listentry, false);
	collision_rectangle_list(exit_x - margx, exit_y - margy, exit_x + margx, exit_y + margy, inst, false, false, listexit, false);
	
	//EXTRY
	for (var a = 0; a < ds_list_size(listentry); a++) {
		var found = false;
		var p = listentry[| a];
		for (var i = 0; i < ds_list_size(teleported); i++) {
			var obj = teleported[| i];
			if (p == obj[0]) {
				found = true;
				break;
			}
		}
		if (!found) {
			ds_list_add(teleport, [p, true]);
			portal_used_entry = true;
		}
	}
		
	//EXIT
	for (var a = 0; a < ds_list_size(listexit); a++) {
		var found = false;
		var p = listexit[| a];
		for (var i = 0; i < ds_list_size(teleported); i++) {
			var obj = teleported[| i];
			if (p == obj[0]) {
				found = true;
				break;
			}
		}
		if (!found) {
			ds_list_add(teleport, [p, false]);
			portal_used_exit = true;
		}
	}
	
	//TELEPORT
	for (var i = 0; i < ds_list_size(teleport); i++) {
		var ary = teleport[| i];
		var p = ary[0];
		var from = ary[1];
		ds_list_add(teleported, [p, from]);
		var offset = 0;
		if (p.object_index == oRocket) {
			offset = p.rocket_map[? ROCKET_MAP.OFFSET] * p.image_xscale;
			p.image_xscale /= 4;
			p.image_yscale /= 4;
		}
		if (from) {
			p.x = exit_x + offset;
			p.y = exit_y;
		} else {
			p.x = x + offset;
			p.y = y;
		}
	}
	ds_list_destroy(listentry);
	ds_list_destroy(listexit);
	ds_list_destroy(teleport);
}