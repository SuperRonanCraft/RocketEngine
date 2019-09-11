var map = weapon_map[? WEAPON_MAP.MAP];
scDrawSpriteExt(x, y, map[? "shield_spr"], floor(map[? "shield_img"]), noone, image_alpha, image_yscale - 0.2, image_xscale - 0.2, image_angle);
map[? "shield_img"] += map[? "shield_img_spd"];
if (floor(map[? "shield_img"]) >= map[? "shield_img_max"])
	map[? "shield_img"] = 0;