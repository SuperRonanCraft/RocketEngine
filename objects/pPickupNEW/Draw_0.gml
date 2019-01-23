/// @desc animate item

draw_self();

var percent = current_cooldown / cooldown;
scDrawPie(x, y, cooldown - current_cooldown, cooldown, c_black, 34, 0.5);

if (current_item != noone)
	draw_sprite(current_item, 0, x + 10, y + scMovementWave(-2, 2, 1));
//if (current_delay > 0)
//	percent = current_delay / delay;
	
//var yy = bbox_bottom + 4, yy2 = bbox_bottom + 6;
//scDrawRect(x - 26, yy + 1, x + 26, yy2 + 1, c_black, false, 0.9);
//scDrawRect(x - 25, yy, x - 25 + (percent * 50), yy2, c_yellow, false, 0.9);