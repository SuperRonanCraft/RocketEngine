/// @desc Display Health and rocket
if (display != DISPLAYTYPE.SCREEN)
	exit;
hpscale = max(hpscale * 0.95, 1);
//Left by default
var sidepos = width * 11 - 2;
if (team == TEAM.RIGHT)
	sidepos = (RES_W - width * 2);

//Display health
var offset = 0;
for (var i = 0; i < hp_original; i++) {
	if (i mod 10 == 0)
		offset++;
	var xpos = (sidepos - (width * 10)) + (i mod 10) * (width + 2);
	var ypos = (offset * (height + 2));
	if (hp > i)
		draw_sprite_ext(sHealth, 0, xpos, ypos, hpscale, hpscale, 0, c_white, 1);
	else
		draw_sprite_ext(sHealth, 1, xpos, ypos, hpscale, hpscale, 0, c_white, 1);
}
//Display buffs
offset = 0;
sidepos = 20;
	if (team == TEAM.RIGHT)
		sidepos = (RES_W - 20)
for (var i = 0; i < ds_list_size(buffs); i++) {
	if (i mod 10 == 0)
		offset++;
	var ds_list = buffs[| i];
	var sprite = ds_list[? "icon"];
	var w = sprite_get_width(sprite);
	var h = sprite_get_height(sprite);
	var alpha = (ds_list[? "clock"] / ds_list[? "time"]) * 100;
	var xpos = (sidepos) + (i mod 10) * (w + 2);
	var ypos = (offset * (h + 2));
	draw_sprite_ext(sprite, 0, xpos, ypos, 1 / 4, 1 / 4, 0, c_white, 1 - (alpha / 100));
}