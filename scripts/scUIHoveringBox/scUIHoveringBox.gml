/// @desc helps with seeing if a mouse is hovering over a certain part of the screen with the arguments provided
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg xbuffer
/// @arg ybuffer

var x1 = argument0, x2 = argument2;
var y1 = argument1, y2 = argument3;
var xbuff = argument4 / 2, ybuff = argument5 / 2;
var mousey = device_mouse_y_to_gui(0), mousex = device_mouse_x_to_gui(0);

//View hover box (for debugging)
if (global.debug)
	scDrawRect(x1 - xbuff, y1 - ybuff, x2 + xbuff, y2 + ybuff, c_blue, true, 1);


if (mousey > y1 - ybuff && mousey < y2 + ybuff)
	if (mousex > x1 - xbuff && mousex < x2 + xbuff)
		return true;
return false;