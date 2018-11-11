/// @desc Update Camera

//Update object
x += (xTo - x) / 10;
y += (yTo - y) / 10;

//Center inside room
x = clamp(x, 0, room_width - view_w);
y = clamp(y, 0, room_height - view_h);

//x += random_range(-shake_remain, shake_remain);
//y += random_range(-shake_remain, shake_remain);
//shake_remain = max(0, shake_remain - ((1 / shake_lenght) * shake_magnitude));

//Update camera
camera_set_view_pos(cam, x, y);

/*if (!global.inmenu) {
	if (layer_exists(mountainLayer))
		layer_x(mountainLayer, x / 1.1);
	if (layer_exists(treesLayer))
		layer_x(treesLayer, x / 5);
}*/