// @desc draw item


var val = delay_current <= 0 ? timer_current : delay_current;
var val_max = delay_current <= 0 ? timer : delay;

//scDrawPie(x, y, val, val_max, c_black, 34, 0.5);
var percent = val / val_max;
var yy = bbox_bottom + 4, yy2 = bbox_bottom + 6;
scDrawRect(x - 26, yy - 1, x + 26, yy2 + 1, c_black, false, 0.3);
scDrawRect(x - 25, yy, x - 25 + (percent * 50), yy2, c_green, false, 0.3);

if (item != noone) {
	image_alpha = alpha_item;
	draw_sprite_ext(item, 0, x + item_xoffset, y + item_yoffset, 
		item_scale, item_scale, 0, c_white, image_alpha);
} else
	image_alpha = alpha_cooldown;

draw_self();
	