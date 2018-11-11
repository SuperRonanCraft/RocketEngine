/// @desc Change the camera position related to the selected stage
if (stage_on_current != stage_on) {
	var wp_map = global.stages[stage_on];
	xTo = wp_map[? "x"];
	yTo = wp_map[? "y"];
	stage_on_current = stage_on;
} 
// Inherit the parent event
event_inherited();