/// @desc Animation/Sprite
//Update the direction the player should face
//scDirection(true);

//Draw event for ultimates
scUltimateHandlerDraw();

//Animate the player in their current state
scAnimationState();

//Show weapon clip if larger than 1
if (rockets_enabled && hp > 0 && global.play) {
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

//Show players collision box while in debug mode
if (global.debug)
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);