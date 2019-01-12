/// @desc 
if (!standing)
	image_index = 0; 
else if (trapped != noone)
	image_index = 2;
else
	image_index = 1;

draw_self();

scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, false, 0.5);
scDrawCircle(x, y, 5, c_blue, false, 0.5);

