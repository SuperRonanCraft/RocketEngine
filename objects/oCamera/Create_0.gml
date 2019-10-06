//Setup Camera
cam = view_camera[view_current];
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
keynum = 0;