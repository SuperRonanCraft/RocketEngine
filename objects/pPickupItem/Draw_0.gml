/// @desc animate item
draw_self();

if (current_item != noone)
	draw_sprite(current_item, 0, x, y - 30 + scMovementWave(-2, 2, 1));

scDrawLine(x - 20, y + 30, x + 20, y + 30, c_black, 2, 1);

var yy = bbox_bottom - 4, yy2 = bbox_bottom - 8;
var percent = current_cooldown / cooldown;
scDrawRect(x - 26, yy + 1, x + 26, yy2 + 1, c_black, false, 0.9);
scDrawRect(x - 25, yy, x - 25 + (percent * 50), yy2, c_yellow, false, 0.9);