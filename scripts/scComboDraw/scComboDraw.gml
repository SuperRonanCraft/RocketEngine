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
	scDrawText(xx, map[? COMBO_MAP.POS_Y], text, c_yellow, map[? COMBO_MAP.SCALE] * 0.5, noone, map[? COMBO_MAP.ALPHA], fa_center, fa_center);
	map[? COMBO_MAP.ALPHA] = lerp(map[? COMBO_MAP.ALPHA], 0, 0.05);
}
map[? COMBO_MAP.SCALE] = max(map[? COMBO_MAP.SCALE] * 0.95, 1); //Lower combo scale