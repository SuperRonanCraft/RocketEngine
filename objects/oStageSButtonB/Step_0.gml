/// @desc Change the camera position related to the selected stage

with (oStageSelect) {
	if (mouse_moving) 
		other.hovering = point_in_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), other.x, other.y, other.height);
	if (other.hovering && mouse_check_button_pressed(mb_left) || other.selected_key) {
		other.selected = true;
		other.selected_current_cd = other.selected_cd;
	} else
		other.selected = false;
	//Check if selected, change the stage selection
	if (other.selected) {
		stage_on--;
		if (stage_on < 0)
			stage_on = stages - 1;
		other.selected_key = false;
	}
}