/// @desc do not draw rocket until indication is done
if (spawn_time > 0) {
	spawn_time--;
	var val = sin((get_timer() / 500000) + offset);
	draw_set_alpha(val * sign(val));
	var ybtm = RES_H;
	if (wall != noone)
		ybtm = wall.bbox_top;
	draw_line_width_color(x, 0, x, ybtm, 3, c_red, c_red);
	draw_set_alpha(1);
} else
	draw_self();
