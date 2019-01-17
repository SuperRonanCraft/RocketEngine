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