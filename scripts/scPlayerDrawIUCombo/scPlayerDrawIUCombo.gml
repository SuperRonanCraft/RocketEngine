//DRAW PLAYER COMBO
var map = combo_map;
if (map[? COMBO_MAP.STREAK] > 1) {
	var xpos = team == TEAM.LEFT ? 50 : RES_W - 50;
	var align = team == TEAM.LEFT ? fa_left : fa_right;
	var ctext = "x" + string(map[? COMBO_MAP.STREAK]) + " " + map[? COMBO_MAP.TEXT];
	scDrawText(xpos, 50, ctext, c_yellow, map[? COMBO_MAP.SCALE] * 0.5, noone, noone, align);
}
map[? COMBO_MAP.SCALE] = max(map[? COMBO_MAP.SCALE] * 0.95, 1); //Lower combo scale