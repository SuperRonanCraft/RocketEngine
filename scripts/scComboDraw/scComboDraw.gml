//DRAW PLAYER COMBO
var map = combo_map;
if (map[? COMBO_MAP.STREAK_LAST] > 1 && map[? COMBO_MAP.ALPHA] > 0) {
	var text = "x" + string(map[? COMBO_MAP.STREAK_LAST]) + " " + map[? COMBO_MAP.TEXT];
	var xx = map[? COMBO_MAP.POS_X];
	var width = string_width(text) / 4;
	if (xx + width + 10 > room_width)
		xx = room_width - width - 10;
	else if (xx - width - 10 < 0)
		xx = width + 10;
	var c = c_yellow;
	if (map[? COMBO_MAP.STREAK_LAST] > 3)
		c = make_color_hsv(min(10, map[? COMBO_MAP.STREAK_LAST]) * map[? COMBO_MAP.COOLDOWN] mod 255, 255, 255);
	scDrawText(xx, map[? COMBO_MAP.POS_Y], text, c, map[? COMBO_MAP.SCALE] * 0.5, noone, map[? COMBO_MAP.ALPHA], fa_center, fa_center);
	map[? COMBO_MAP.ALPHA] = max(0, map[? COMBO_MAP.ALPHA] - 0.05);
}
map[? COMBO_MAP.SCALE] = max(map[? COMBO_MAP.SCALE] * 0.95, 1); //Lower combo scale

if (map[? COMBO_MAP.STREAK] > 1) {
	if (map[? COMBO_MAP.DIALATED] < map[? COMBO_MAP.DIALATED_MAX]) {
		map[? COMBO_MAP.DIALATED]++;
		with (oPlayer)
			time_dialation = 0;
	}
}