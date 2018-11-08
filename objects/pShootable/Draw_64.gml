/// @desc Display Health
if (display != DISPLAYTYPE.SCREEN)
	exit;
scale = max(scale * 0.95, 1);
var offset = 0;
//Left by default
var sidepos = width * 11 - 2;
if (side == SIDE.RIGHT)
	sidepos = (RES_W - width * 2);

//Display the health
for (var i = 0; i < hp_original; i++) {
	if (i mod 10 == 0)
		offset++;
	var xpos = (sidepos - (width * 10)) + (i mod 10) * (width + 2);
	var ypos = (offset * (height + 2));
	if (hp > i)
		draw_sprite_ext(sHealth, 0, xpos, ypos, scale, scale, 0, c_white, 1);
	else
		draw_sprite_ext(sHealth, 1, xpos, ypos, scale, scale, 0, c_white, 1);
}