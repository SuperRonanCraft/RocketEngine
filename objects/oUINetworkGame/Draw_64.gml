/// @desc gamemode stage selection draw gui event

//Gamemode name
if (!global.play)
	scDrawText(xx, yy, "Waiting on players...", c_ltgray, 2);

//UI Draw event
event_inherited();