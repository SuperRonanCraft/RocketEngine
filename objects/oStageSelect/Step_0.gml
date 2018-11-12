/// @desc Change the camera position related to the selected stage


var mouse_y_current = device_mouse_y_to_gui(0);
if (mouse_y_gui != mouse_y_current) {
	mouse_moving = true;
	mouse_y_gui = mouse_y_current;
} else
	mouse_moving = false;
	
if (stage_on_current != stage_on) {
	var wp_map = global.stages[stage_on];
	xTo = wp_map[? "x"];
	yTo = wp_map[? "y"];
	stage_on_current = stage_on;
} 
// Inherit the parent event
event_inherited();