/// @desc weapon clip
var map = weapon_map;
if (map[? WEAPON_MAP.ENABLED] && shootable_map[? SHOOTABLE_MAP.HEALTH] > 0 && global.play && global.weapon_info && player_map[? PLAYER_MAP.HUD_SHOW]) {
	var clip = map[? WEAPON_MAP.CLIP];
	if (clip > 1) {
		var xx = x - 30;
		var yy = bbox_bottom;
		for (var i = 0; i < clip; i++) {
			yy -= 5;
			scDrawLine(xx, yy, xx + 10, yy, map[? WEAPON_MAP.AMMO] > i ? c_yellow : c_gray, 2, 0.5);
		}
	}
	if (map[? WEAPON_MAP.RELOAD_TIME] > 0) {
		var xx = x - 37;
		var yy = bbox_bottom - 3;
		var margin = 2, len = 25, width = 3;
		var percent = map[? WEAPON_MAP.RELOAD_TIME] / map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL];
		scDrawLine(xx, yy, xx, yy - len, c_gray, width + margin, 0.5);
		scDrawLine(xx, yy - (margin / 2), xx, yy - margin - ((len - margin) * percent), c_red, width, 0.5);
	} else if (map[? WEAPON_MAP.COOLDOWN_TIME] > 0) {
		var xx = x - 37;
		var yy = bbox_bottom - 3;
		var margin = 2, len = 25, width = 3;
		var percent = map[? WEAPON_MAP.COOLDOWN_TIME] / map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL];
		scDrawLine(xx, yy, xx, yy - len, c_gray, width + margin, 0.5);
		scDrawLine(xx, yy - (margin / 2), xx, yy - margin - ((len - margin) * percent), c_yellow, width, 0.5);
	}
}
