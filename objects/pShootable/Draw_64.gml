/// @desc Display Health, Buff n' Rocket
if (display != DISPLAYTYPE.SCREEN)
	exit;
hpscale = max(hpscale * 0.95, 1);
//Left by default
var sidepos = team == TEAM.LEFT ? hpwidth * 11 - 2 : RES_W - hpwidth * 2 ;
//Display health
var offset = 0;
for (var i = 0; i < hp_original; i++) {
	//Offset every 10 hearts
	if (i mod 10 == 0)
		offset++;
	//Weird math
	var xpos = (sidepos - (hpwidth * 10)) + (i mod 10) * (hpwidth + 2);
	//Change every 10 hearts
	var ypos = offset * (hpheight + 2);
	if (hp > i)
		draw_sprite_ext(hpsprite, 0, xpos, ypos, hpscale, hpscale, 0, c_white, 0.8);
	else
		draw_sprite_ext(hpsprite, 1, xpos, ypos, hpscale, hpscale, 0, c_white, 0.8);
}
//Display Buffs
offset = 0;
for (var i = 0; i < ds_list_size(buffs); i++) {
	//Offset every 10 buffs
	if (i mod 10 == 0)
		offset++;
	//Display in a straight line down
	var ds_list = buffs[| i];
	//The icon set in the buff
	var sprite = ds_list[? "icon"];
	//Dimentions
	var w = sprite_get_width(sprite);
	var h = sprite_get_height(sprite);
	//Alpha to display icon (kidna like a timer to wear off)
	var alpha = (ds_list[? "clock"] / ds_list[? "time"]) * 100;
	var xpos = team == TEAM.LEFT ? (RES_W / 2) - (w) - (((w / 2) + 4) * i) : (RES_W / 2) + (w / 2) + (((w / 2) + 4) * i);
	var ypos = offset * (h / 2 + 2) + (RES_H / 32);
	draw_sprite_ext(sprite, 0, xpos, ypos, 0.5, 0.5, 0, c_white, 1 - (alpha / 100));
}
//Display Rocket Equipped
if (rocket_map[? ROCKET_MAP.TYPE] != ROCKET.NONE) {
	//The icon set in the buff
	var sprite = rocket_map[? ROCKET_MAP.PROJECTILE];
	//Dimentions
	var w = sprite_get_width(sprite);
	var h = sprite_get_height(sprite);
	//Weird math
	var xpos = team == TEAM.LEFT ? RES_W / 4 - w / 3 : RES_W / 2 + RES_W / 4 + w / 3;
	var ypos = h / 2;
	draw_sprite_ext(sprite, 0, xpos, ypos, (team == TEAM.LEFT ? 1 : -1) * prj_scale, 1 * prj_scale, 0, c_white, 0.8);
	prj_scale = max(prj_scale * 0.95, 1);
}