/// @description move camera

if (stage_on_current != stage_on) {
	var wp_map = global.stages[stage_on];
	xTo = wp_map[? "x"];
	yTo = wp_map[? "y"];
	stage_on_current = stage_on;
} 

//Update camera position
x += (xTo - x) / 10;
y += (yTo - y) / 10;

//Center inside room
x = clamp(x, 0, room_width - view_w);
y = clamp(y, 0, room_height - view_h);

//Update camera
camera_set_view_pos(cam, x, y);