/// @desc Animation/Sprite

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
	if (current_cd > 0) {
		var xx = x + 35
		var yy = bbox_bottom;
		var percent = current_cd / rocket_map[? ROCKET_MAP.COOLDOWN];
		scDrawLine(xx, yy, xx, yy - 20, c_gray, 5, 0.5);
		scDrawLine(xx, yy, xx, yy - (20 * percent), c_yellow, 3, 0.5);
	}
}

//Show players collision box while in debug mode
if (global.debug) {
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);
	//ANIMATION STATE
	scDrawText(bbox_left, bbox_top - 10, "Animation State: " + string(animState), noone, 0.3);
	//PLAYER STATE
	scDrawText(bbox_left, bbox_top - 30, "Player State: " + string(playerState), noone, 0.3);
}