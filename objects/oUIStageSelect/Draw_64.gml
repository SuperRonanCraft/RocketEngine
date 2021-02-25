/// @desc gamemode stage selection draw gui event

//Gamemode name
scDrawText(xx, yy, mode, color_element, 2);
//Stage ID text
if (array_length(global.stages) > 1) {
	var text = "Stage " + string(stage_on + 1) + "/" + string(array_length(global.stages));
	scDrawText(xx2, yy2, text, color_element_input, 0.75);
}

//UI Draw event
event_inherited();