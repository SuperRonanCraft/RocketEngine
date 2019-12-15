/// @desc 
full = !full;

if (full) {
	var cam = view_camera[0];
	camera_set_view_size(cam, room_width, room_height);
	camera_set_view_pos(cam, 0, 0);
} else
	camera_set_view_size(view_camera[0], RES_W, RES_H);