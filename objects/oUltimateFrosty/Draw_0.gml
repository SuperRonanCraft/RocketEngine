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
	var xxof = bbox_left mod 32;
	var yyof = bbox_top mod 32;
	var xx = bbox_left - (xxof > 16 ? xxof - 32 : xxof) - 32; //1 tile left of top left
	var yy = bbox_top - (yyof > 16 ? yyof - 32 : yyof) - 32; //1 tile above of top left
	for (var i = 0; i < 16; i++) {
		if (i != 0 && (i mod 4) == 0) {
			yy += 32;
			xx -= 4 * 32;
			offset++;
		}
		var inst = collision_point(xx + 16, yy + 16, oWall, false, false)
		if (inst != noone && inst.object_index != oSeperator) {
			var addwall = true;
			for (var a = 0; a < ds_list_size(frozen_walls); a++) {
				var map = frozen_walls[| a];
				if (map[? "xx"] == xx && map[? "yy"] == yy) {
					addwall = false; //dont add wall
					map[? "timer"] = frozen_walls_uptime; //reset its timer
				}
			}
			if (addwall) { //add the wall to freeze
				var map = ds_map_create();
				map[? "xx"] = xx;
				map[? "yy"] = yy;
				map[? "timer"] = frozen_walls_uptime;
				map[? "alpha"] = 0;
				ds_list_add(frozen_walls, map);
			}
		}
		xx += 32;
	}
}

var index = 0;
var walls_delete = ds_list_create();
for (var i = 0; i < ds_list_size(frozen_walls); i++) { //Draw frozen wall and apply buff
	var map = frozen_walls[| i];
	if (map[? "alpha"] > 0) {
		scDrawSpriteExt(map[? "xx"], map[? "yy"], sUltFrosty_Wall, 0, noone, map[? "alpha"]);
		var p = instance_place(map[? "xx"], map[? "yy"], oPlayer);
		if (p != noone && p != owner) //Apply buff, ignore owner
			scBuffAdd(BUFFTYPE.CHILLED, p, owner);
	}
	map[? "timer"]--; //tick down timer
	if (map[? "timer"] <= 0) {
		map[? "alpha"] -= 0.025;
		if (map[? "alpha"] <= 0)
			ds_list_add(walls_delete, index);
	} else {
		map[? "alpha"] = min(map[? "alpha"] + 0.025, 0.6);
		index++;
	}
}

for (var i = 0; i < ds_list_size(walls_delete); i++) {
	var map = frozen_walls[| walls_delete[| i]];
	ds_map_destroy(map);
	ds_list_delete(frozen_walls, walls_delete[| i]);
}
ds_list_destroy(walls_delete);

if (global.debug) {
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);
	var xxof = bbox_left mod 32;
	var yyof = bbox_top mod 32;
	var xx = bbox_left - (xxof > 16 ? xxof - 32 : xxof) - 32; //1 tile left of top left
	var yy = bbox_top - (yyof > 16 ? yyof - 32 : yyof) - 32; 
	scDrawRect(xx, yy, xx + (32 * 4), yy + (32 * 4), c_red, true, 1);
}