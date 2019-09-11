if (destroy)
	sprite_index = noone;

var map = teleportMap;
var size = map[? "portal_size"]
if (size > 0) {
	//scDrawCircle(xstart + map[? "target_dis"], map[? "target_y"], rad, c_blue, false, 1);
	//scDrawCircle(xstart + map[? "target_dis"], ystart, rad, c_blue, false, 1);
	var rocket_map = weapon_map[? WEAPON_MAP.MAP];
	var xx = xstart + map[? "target_dis"] - (sign(map[? "target_dis"]) * (rocket_map[? ROCKET_MAP.OFFSET] / 2)), yy = map[? "target_y"];
	var sprite = map[? "portal_sprite"], img = floor(map[? "portal_img"]), alpha = 0.75 * size;
	scDrawSpriteExt(xx, yy, sprite, img, c_white, alpha);
	scDrawSpriteExt(xx, ystart, sprite, img, c_white, alpha);
	map[? "portal_img"] += map[? "portal_speed"];
	if (floor(map[? "portal_img"]) > map[? "portal_img_amt"])
		map[? "portal_img"] = 0;
	map[? "portal_part"] += 1;
	if (map[? "portal_part"] == 5) {
		var marginx = 12;
		var marginy = 32;
		scDrawParticle(xx - marginx, yy - marginy, xx + marginx, yy + marginy, PARTICLES.PORTAL, 1);
		scDrawParticle(xx - marginx, ystart - marginy, xx + marginx, ystart + marginy, PARTICLES.PORTAL, 1);
		map[? "portal_part"] = 0;
	}
}