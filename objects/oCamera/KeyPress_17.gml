/// @desc 
full = !full;


	var cam = view_camera[0];

if (full) {
	camera_set_view_size(cam, RES_W * 3, RES_H * 3);
	//camera_set_view_pos(cam, 0, 0);
} else
	camera_set_view_size(cam, RES_W, RES_H);