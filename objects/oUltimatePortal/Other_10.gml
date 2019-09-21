/// @desc collision event
if (!global.play) exit;

for (var e = 0; e < 2; e++) {
	var inst = e == 0 ? oPlayer : pWeapon;
	var listentry = ds_list_create();
	var listexit = ds_list_create();
	var teleport = ds_list_create();
	var removelist = ds_list_create();
	
//IGNORE BOX
	
	//ENTRY AND EXIT
	var margx = marginx, margy = marginy; //IGNORE MARGINS
	collision_rectangle_list(x - margx, y - margy, x + margx, y + margy, inst, false, false, listentry, false);
	collision_rectangle_list(exit_x - margx, exit_y - margy, exit_x + margx, exit_y + margy, inst, false, false, listexit, false);
	
	for (var i = 0; i < ds_list_size(listexit); i++)
		ds_list_add(listentry, listexit[| i])
	
	//Check who to ignore
	for (var a = 0; a < ds_list_size(teleported); a++) {
		var found = false;
		var ary = teleported[| a];
		var p = ary[0]; //Previously teleported object
		for (var i = 0; i < ds_list_size(listentry); i++) {
			var pl = listentry[| i]; //Object inside the ignore box
			if (p == pl) { //inside ignore and was teleported
				found = true;
				break;
			}
		}
		if (!found)
			ds_list_add(removelist, p); //Dont remove, as still inside ignore box
	}
	
	//Delete ignored
	for (var i = 0; i < ds_list_size(removelist); i++) {
		var p = removelist[| i];
		for (var a = 0; a < ds_list_size(teleported); a++) {
			var ary = teleported[| a];
			var obj = ary[0];
			var remove = !instance_exists(obj);
			if (!remove)
				switch (inst) {
					case pWeapon:
						remove = object_get_parent(obj.object_index) == inst; break;
					default:
						remove = obj.object_index == inst && obj == p; break;
				}
			if (remove) {
				ds_list_delete(teleported, a);
				break;
			}
		}
	}
	ds_list_destroy(removelist);
	ds_list_clear(listentry);
	ds_list_clear(listexit);
	
//TELEPORT BOX
	
	var margx = marginx / 2, margy = marginy / 2; //TELEPORT MARGINS

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
		var from = ary[1]; //Came in from? (true = entrance)
		ds_list_add(teleported, [p, from]);
		var offset = 0;
		if (p.object_index == oRocket) {
			var rocket_map = p.weapon_map[? WEAPON_MAP.MAP];
			offset = rocket_map[? ROCKET_MAP.OFFSET] * 
				((from ? -image_xscale : image_xscale) * -p.image_xscale);
			p.image_xscale /= 4;
			p.image_yscale /= 4;
		}
		if (from) { //Came in from entrance
			if (p.object_index == oPlayer) //WALL SAFETY (Like dynamic walls (brick ult))
				with (p)
					if (instance_place(other.exit_x + offset, other.exit_y, oWall) != noone)
						exit;
			p.x = exit_x + offset;
			p.y = exit_y;
		} else { //Came in from exit
			if (p.object_index == oPlayer) //WALL SAFETY (Like dynamic walls (brick ult))
				with (p)
					if (instance_place(other.x + offset, other.y, oWall) != noone)
						exit;
			p.x = x + offset;
			p.y = y;
		}
		scPlaySound(SOUND.ULT_TELEPORT_USE, random_range(0.8, 1.2));
	}
	ds_list_destroy(listentry);
	ds_list_destroy(listexit);
	ds_list_destroy(teleport);
}