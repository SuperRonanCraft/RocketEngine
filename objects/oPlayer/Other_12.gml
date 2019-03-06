/// @desc gamepad stuff
if (!global.debug) exit;
var scale = 0.3;
for (var i = 0; i < 2; i++;) {
	var xx = 32;
	var yy = 128 + (160 * i);
	if gamepad_is_connected(i) {
	    scDrawText(xx, yy, "Gamepad Slot - " + string(i), noone, scale, noone, noone, fa_left);
	    scDrawText(xx, yy + 20, "Gamepad Type - " + string(gamepad_get_description(i)), noone, scale, noone, noone, fa_left);
	    scDrawText(xx, yy + 40, "Left H Axis - " + string(gamepad_axis_value(i, gp_axislh)), noone, scale, noone, noone, fa_left);
	    scDrawText(xx, yy + 60, "Left V Axis - " + string(gamepad_axis_value(i, gp_axislv)), noone, scale, noone, noone, fa_left);
	    scDrawText(xx, yy + 80, "Right H Axis - " + string(gamepad_axis_value(i, gp_axisrh)), noone, scale, noone, noone, fa_left);
	    scDrawText(xx, yy + 100, "Right V Axis - " + string(gamepad_axis_value(i, gp_axisrv)), noone, scale, noone, noone, fa_left);   
	    scDrawText(xx, yy + 120, "Fire Rate - " + string(gamepad_button_value(i, gp_shoulderrb)), noone, scale, noone, noone, fa_left);
	} else {
	    scDrawText(xx, yy, "Gamepad Slot - " + string(i), noone, scale, noone, noone, fa_left);
	    scDrawText(xx, yy + 20, "Gamepad not connected" + string(gamepad_get_description(i)), noone, scale, noone, noone, fa_left);
	}
}