/// @desc particles

draw_self();

if (touching_floor && (hsp > 1 || hsp < -1)) //if sliding, draw particles
	if (particle_crt == particle_amt) {
		scDrawParticle(bbox_left, bbox_bottom - 3, bbox_right, bbox_bottom + 3, PARTICLES.ICE, 2);
		particle_crt = 0;
	} else
		particle_crt++;

if (freezing) { //Freezing area?
	var offset = 0;
	var xx = bbox_left - 64 - (bbox_left mod 32); //1 tile left of top left
	var yy = bbox_top - 32 - (bbox_top mod 32); //1 tile above of top left
	for (var i = 0; i < 16; i++) {
		if (i != 0 && (i mod 4) == 0) {
			yy += 32;
			xx -= 4 * 32;
			offset++;
		}
		xx += 32;
		if (collision_point(xx + 16, yy + 16, oWall, false, false)) {
			var addwall = true;
			for (var a = 0; a < ds_list_size(frozen_walls); a++) {
				var map = frozen_walls[| a];
				if (map[? "xx"] == xx && map[? "yy"] == yy) {
					addwall = false; //dont readd wall
					map[? "timer"] = frozen_walls_uptime; //reset its timer
				}
			}
			if (addwall) { //add the wall to freeze
				var map = ds_map_create();
				ds_list_add(frozen_walls, map);
				map[? "xx"] = xx;
				map[? "yy"] = yy;
				map[? "timer"] = frozen_walls_uptime;
			}
		}
	}
}

var index = 0;
for (var i = 0; i < ds_list_size(frozen_walls); i++) { //Draw frozen wall and apply buff
	var map = frozen_walls[| index];
	scDrawSpriteExt(map[? "xx"], map[? "yy"], sUltFrosty_Wall, 0, noone, 0.5);
	var p = instance_place(map[? "xx"], map[? "yy"], oPlayer);
	if (p != noone)
		scBuffAdd(BUFFTYPE.CHILLED, p, owner);
	map[? "timer"]--; //tick down timer
	if (map[? "timer"] <= 0) {
		ds_list_delete(frozen_walls, index);
		ds_map_destroy(map);
	} else
		index++;
}

if (global.debug) { //show area of effect
	var offset = 0;
	var xx = bbox_left - 64 - (bbox_left mod 32); //1 tile left of top left
	var yy = bbox_top - 32 - (bbox_top mod 32); //1 tile above of top left
	for (var i = 0; i < 16; i++) {
		if (i != 0 && (i mod 4) == 0) {
			yy += 32;
			xx -= 4 * 32;
			offset++;
		}
		xx += 32;
		scDrawRect(xx, yy, xx + 31, yy + 31, c_red, false, 0.5);	
	}
}