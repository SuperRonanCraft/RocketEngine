/// @desc Display Health and Buff
if (display != DISPLAYTYPE.SCREEN)
	exit;
hpscale = max(hpscale * 0.95, 1);
//Left by default
var sidepos = team == TEAM.LEFT ? width * 11 - 2 : RES_W - width * 2 ;
//Display health
var offset = 0;
for (var i = 0; i < hp_original; i++) {
	//Offset ever 10 hearts
	if (i mod 10 == 0)
		offset++;
	//Weird math
	var xpos = (sidepos - (width * 10)) + (i mod 10) * (width + 2);
	//Change every 10 hearts
	var ypos = offset * (height + 2);
	if (hp > i)
		draw_sprite_ext(sHealth, 0, xpos, ypos, hpscale, hpscale, 0, c_white, 1);
	else
		draw_sprite_ext(sHealth, 1, xpos, ypos, hpscale, hpscale, 0, c_white, 1);
}
//Display buffs
for (var i = 0; i < ds_list_size(buffs); i++) {
	//Display in a straight line down
	var ds_list = buffs[| i];
	//The icon set in the buff
	var sprite = ds_list[? "icon"];
	//Dimentions
	var w = sprite_get_width(sprite);
	var h = sprite_get_height(sprite);
	//Alpha to display icon (kidna like a timer to wear off)
	var alpha = (ds_list[? "clock"] / ds_list[? "time"]) * 100;
	var xpos = team == TEAM.LEFT ? 2 : RES_W - (w / 2) - 2;
	var ypos = i * (h / 2 + 2) + 50;
	draw_sprite_ext(sprite, 0, xpos, ypos, 0.5, 0.5, 0, c_white, 1 - (alpha / 100));
}