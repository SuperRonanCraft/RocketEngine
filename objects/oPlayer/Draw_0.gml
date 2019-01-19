/// @desc Animation/Sprite

if (ult_casting) {
	var yy = bbox_top - 4, yy2 = bbox_top - 8;
	var percent = (ult_cast_time_max - ult_cast_time) / ult_cast_time_max;
	scDrawRect(x - 51, yy + 1, x + 51, yy2 + 1, c_black, false, 0.9);
	scDrawRect(x - 50, yy, x - 50 + (percent * 100), yy2, c_yellow, false, 0.9);
}

scDirection(true);
scUltimateHandlerDraw();

//Animate the player in their current state
scAnimationState();

//draw_text(x,y-100,hsp_move);

if (rockets_enabled && hp > 0) {
	var clip = rocket_map[? ROCKET_MAP.CLIP];
		if (clip > 1) {
		var xx = x - 30;
		var yy = bbox_bottom;
		for (var i = 0; i < clip; i++) {
			yy -= 5;
			scDrawLine(xx, yy, xx + 10, yy, ammo > i ? c_yellow : c_gray, 2, 0.5);
		}
	}
}

if (ult_enabled && ult_charge == ult_charge_max)
	scDrawCircle(x + 25, bbox_top, 5, c_green, false, scMovementWave(0.3, 0.8, 1));

if (global.debug)
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);