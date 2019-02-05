//Setup Camera
//view_camera[0] = camera_create_view(0, 0, RES_W, RES_H);
cam = view_camera[view_current];
//camera_set_default(cam);
//follow = oPlayer;
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;
xTo = 0;
yTo = 0;

shake_lenght = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 0;
cam_speed = (25 / TIME_SPEED);

//Code
keynum_timer = 3 * room_speed;
keynum = 0;