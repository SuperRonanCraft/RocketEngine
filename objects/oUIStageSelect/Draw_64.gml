/// @desc gamemode stage selection draw gui event

//Gamemode name
scDrawText(xx, yy, global.gamemode, color_element, 2);
//Stage ID text
var text = "Stage " + string(stage_on + 1) + "/" + string(array_length_1d(global.stages));
scDrawText(xx2, yy2, text, color_element_input, 0.4);

//UI Draw event
event_inherited();