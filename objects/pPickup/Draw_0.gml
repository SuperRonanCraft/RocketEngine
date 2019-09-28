// @desc draw item


var val = delay_current <= 0 ? timer_current : delay_current;
var val_max = delay_current <= 0 ? timer : delay;

y = ystart + scMovementWave(-draw_offset, draw_offset, draw_offset);

if (item != noone) {
	image_alpha = min(image_alpha + (0.05 / TIME_SPEED), alpha_item);
	draw_sprite_ext(item, 0, x + item_xoffset, y + item_yoffset, 
		item_scale, item_scale, 0, c_white, image_alpha);
	if (time_show) {
		var percent = val / val_max;
		var yy = bbox_bottom + 4, yy2 = bbox_bottom + 6;
		scDrawRect(x - 26, yy - 1, x + 26, yy2 + 1, c_black, false, 0.3);
		scDrawRect(x - 25, yy, x - 25 + (percent * 50), yy2, c_green, false, 0.3);
	}
} else
	image_alpha = max(image_alpha - (0.05 / TIME_SPEED), alpha_cooldown);

//draw_self();

if (hacked)
	scDrawParticle(bbox_left, bbox_top, bbox_right, bbox_bottom, PARTICLES.HACK, 2);