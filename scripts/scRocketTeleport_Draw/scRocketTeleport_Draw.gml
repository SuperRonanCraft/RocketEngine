if (destroy)
	sprite_index = noone;

var map = teleportMap;
var size = map[? "portal_size"]
if (size > 0) {
	//scDrawCircle(xstart + map[? "target_dis"], map[? "target_y"], rad, c_blue, false, 1);
	//scDrawCircle(xstart + map[? "target_dis"], ystart, rad, c_blue, false, 1);
	var xx = xstart + map[? "target_dis"];
	var sprite = map[? "portal_sprite"], img = floor(map[? "portal_img"]), alpha = 0.75 * size;
	scDrawSpriteExt(xx, map[? "target_y"], sprite, img, c_white, alpha);
	scDrawSpriteExt(xx, ystart, sprite, img, c_white, alpha);
	map[? "portal_img"] += map[? "portal_speed"];
	if (floor(map[? "portal_img"]) > map[? "portal_img_amt"])
		map[? "portal_img"] = 0;
}