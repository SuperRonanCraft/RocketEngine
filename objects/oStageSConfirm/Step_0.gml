/// @desc Change the camera position related to the selected stage
hovering = point_in_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x, y, height);
selected = hovering && mouse_check_button_pressed(mb_left);

//Check if clicked, confirm selection
if (instance_exists(oStageSelect))
	if (selected)
		with (oStageSelect)
			event_user(0);