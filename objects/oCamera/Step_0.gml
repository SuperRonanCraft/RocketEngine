/// @desc Update Camera
//Update object
x += (xTo - x) / cam_speed;
y += (yTo - y) / cam_speed;

//Respect x
if (respect_room_left && respect_room_right)
	x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
else if (respect_room_right)
	x = min(x, room_width - view_w_half - buff);
else if (respect_room_left)
	x = max(x, view_w_half + buff);
//Respect y
if (respect_room_bottom && respect_room_top)
	y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);
else if (respect_room_bottom)
	y = min(y, room_height - view_h_half - buff);
else if (respect_room_top)
	y = max(y, view_h_half + buff);
	

//if (full) exit;
//x += random_range(-shake_remain, shake_remain);
//y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_lenght) * shake_magnitude));

//Update camera
if (!full)
	camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
else
	camera_set_view_pos(cam, x - view_w_half * 3, y - view_h_half * 3);

//Code
switch (keynum) {
	case 0: case 1: if (keyboard_check_pressed(vk_up)) keynum += 1; break;
	case 2: case 3: if (keyboard_check_pressed(vk_down)) keynum += 1; break;
	case 4: case 6: if (keyboard_check_pressed(vk_left)) keynum += 1; break;
	case 5: case 7: if (keyboard_check_pressed(vk_right)) keynum += 1; break;
	case 8: if (keyboard_check_pressed(ord("B"))) keynum += 1; break;
	case 9: if (keyboard_check_pressed(ord("A"))) {camera_set_view_angle(cam, camera_get_view_angle(cam) == 0 ? 180 : 0); keynum = 0;} break;
}