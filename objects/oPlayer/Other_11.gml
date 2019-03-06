/// @desc weapon clip
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
