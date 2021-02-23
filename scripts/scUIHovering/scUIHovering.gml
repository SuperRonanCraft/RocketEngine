/// @desc helps with seeing if a mouse is hovering over a certain part of the screen with the arguments provided
/// @arg x
/// @arg y
/// @arg text
/// @arg xbuffer
/// @arg ybuffer
/// @arg scale
/// @arg halign
function scUIHovering(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var xx = argument0, yy = argument1;
	var text = argument2;
	var xbuff = argument3 / 2, ybuff = argument4 / 2;
	var scale = argument5;
	var centered = argument6;
	var mousey = device_mouse_y_to_gui(0), mousex = device_mouse_x_to_gui(0);

	var yoffset = (string_height(text) / 2) + ybuff;
	//X Check
	//---
	var len = string_width(text) * scale; //Width of text in pixels
	var x1 = 0, x2 = 0;
	if (centered == fa_middle) {
		x1 = (len / 2) + xbuff;
		x2 = x1;
	} else if (centered == fa_right) {
		x1 = xbuff + len;
		x2 = xbuff;
	} else if (centered == fa_left) {
		x1 = xbuff;
		x2 = len + xbuff;
	}
	//---

	//View hover box (for debugging)
	if (global.debug)
		scDrawRect(xx - x1, yy - yoffset, xx + x2, yy + yoffset, c_blue, true, 1);


	if (mousey > yy - yoffset && mousey < yy + yoffset)
		if (mousex > xx - x1 && mousex < xx + x2)
			return true;
	return false;


}
