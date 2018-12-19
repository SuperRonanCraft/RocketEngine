/// @desc gamemode stage selection draw gui event

//Gamemode name
scDrawText(xx, yy, global.gamemode, c_gray, 2);
//Stage ID text
var text = "Stage\n" + string(stage_on + 1) + " - " + string(array_length_1d(global.stages));
var yval = yy + RES_H / 2 - (RES_H / 32);
scDrawText(xx, yval, text, c_ltgray, 1);

// Inherit parent event
event_inherited();