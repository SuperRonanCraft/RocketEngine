/// @desc Animation/Sprite

//Draw event for ultimates
scUltimateHandlerDraw();

//Animate the player in their current state
scAnimationState();

//Moving dust
if (standing) {
	var amt = 0;
	var dirs;
	var range = 5;
	if (hsp != 0)
		if (smoke_cur >= smoke_act - irandom(smoke_act / 2)) {
			amt = irandom_range(1, 3);
			dirs = facing != 1 ? [-5, 5] : [175, 185];
			smoke_cur = 0;
		} else
			smoke_cur++;
	if (smoke_lastvsp > 20) {
		amt = 20;
		dirs = [-20, 200];
		range = 15;
		smoke_lastvsp = 0;
	}
	if (amt > 0)
		scDrawParticle(bbox_left - range, bbox_bottom - 5, bbox_right + range, 
			bbox_bottom + 2, PARTICLES.DUST, amt, dirs);
} else
	smoke_lastvsp = vsp;

//Show weapon clip if larger than 1
if (rockets_enabled && hp > 0 && global.play && global.weapon_info) {
	var clip = rocket_map[? ROCKET_MAP.CLIP];
	if (clip > 1) {
		var xx = x - 30;
		var yy = bbox_bottom;
		for (var i = 0; i < clip; i++) {
			yy -= 5;
			scDrawLine(xx, yy, xx + 10, yy, ammo > i ? c_yellow : c_gray, 2, 0.5);
		}
	}
	if (current_reload > 0) {
		var xx = x - 37;
		var yy = bbox_bottom - 3;
		var margin = 2, len = 25, width = 3;
		var percent = current_reload / rocket_map[? ROCKET_MAP.RELOAD_TIME];
		scDrawLine(xx, yy, xx, yy - len, c_gray, width + margin, 0.5);
		scDrawLine(xx, yy - (margin / 2), xx, yy - margin - ((len - margin) * percent), c_red, width, 0.5);
	} else if (current_cd > 0) {
		var xx = x - 37;
		var yy = bbox_bottom - 3;
		var margin = 2, len = 25, width = 3;
		var percent = current_cd / rocket_map[? ROCKET_MAP.COOLDOWN];
		scDrawLine(xx, yy, xx, yy - len, c_gray, width + margin, 0.5);
		scDrawLine(xx, yy - (margin / 2), xx, yy - margin - ((len - margin) * percent), c_yellow, width, 0.5);
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