/// @desc gamemode stage selection draw gui event

//Gamemode name
scDrawText(xx, yy, global.gamemode, color_element, 2);
//Stage ID text
var text = "Stage\n" + string(stage_on + 1) + " - " + string(array_length_1d(global.stages));
var yval = yy + RES_H / 2;
scDrawText(xx, yval, text, color_element_input);

//UI Draw event
event_inherited();