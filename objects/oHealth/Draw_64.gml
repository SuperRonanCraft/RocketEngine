/// @desc Display Health
if (display != DISPLAYTYPE.SCREEN)
	exit;
scale = max(scale * 0.95, 1);
var offset = 0;
for (var i = 0; i < hp; i++) {
	if (i mod 10 == 0)
		offset++;
	var xpos = (RES_W / 2) + ((sprite_width + 2) * (i - (global.player_health_original / 2))) - (scale / 2);
	//var xpos = ((RES_W - 20) - (sprite_width * 10)) + (i mod 10) * (sprite_width + 2);
	var ypos = (offset * (sprite_height + 2)) - 50;
	if (hp > i)
		draw_sprite_ext(sprite_index, 0, xpos, ypos, scale, scale, 0, c_white, 1);
	else
		draw_sprite_ext(sprite_index, 1, xpos, ypos, scale, scale, 0, c_white, 1);
}