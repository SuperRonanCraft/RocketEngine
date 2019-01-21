/// @desc animate item
draw_self();

if (current_rocket != noone)
	draw_sprite(current_rocket, 0, x, y - 10 + scMovementWave(-2, 2, 1));

var percent = current_cooldown / cooldown;
//if (current_delay > 0)
//	percent = current_delay / delay;
	
var yy = bbox_bottom + 4, yy2 = bbox_bottom + 6;
scDrawRect(x - 26, yy + 1, x + 26, yy2 + 1, c_black, false, 0.9);
scDrawRect(x - 25, yy, x - 25 + (percent * 50), yy2, c_yellow, false, 0.9);