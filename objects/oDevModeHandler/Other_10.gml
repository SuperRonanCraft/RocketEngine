/// @desc Buffs Draw GUI

var _yy = tab_y - tab_buf - (tab_buf / 2);

var _scale_o = 0.6; //Original Scale
var columns = 5, offset = 0, index = 0, _buff = 4, size = (64 * _scale_o), scale, map, spr, rx, ry, name;
var _w = columns * ((64 * _scale_o) + _buff) + (tab_buf * 2); //Width
var _h = (ceil(BUFFTYPE.LENGHT / columns) * (size)) + (tab_buf * 2) + (_buff * (ceil(BUFFTYPE.LENGHT / columns) - 1));
var desc = tab_map[? "players"] == noone ? "Select a Player!" : (tab_map[? "buffs_type"] != undefined ? "Enter to re-apply" : noone);
var desc_h = desc != noone ? string_height(desc) * 0.4 : 0;
scDrawRectRound(tab_w + tab_buf, _yy, tab_w + _w, _yy + _h + desc_h, c_white, false, alpha, 8, 8);
if (desc != noone)
	scDrawText(tab_w + ((_w + tab_buf) / 2), _yy + _h, desc, c_fuchsia, 0.4, noone, alpha, fa_middle, fa_top);

for (var i = 0; i < BUFFTYPE.LENGHT; i++) {
	if (index mod columns == 0)
		offset++;
	map = ds_map_create();
	scale = 0.6;
	scBuffGet(i, map); //Grab the buff map
	if (!map[? BUFF_MAP.ENABLED]) { ds_map_destroy(map); continue; }
	spr = map[? BUFF_MAP.ICON]; //Grab the icon
	var size = (64 * scale)
	rx = tab_w + tab_buf + (tab_buf + ((size + _buff) * index)) - ((offset - 1) * ((size + _buff) * columns));
	ry = _yy + tab_buf + (offset - 1) * (size + _buff);
	
	if (scUIHoveringBox(rx, ry, rx + size, ry + size, 0, 0)) {
		scale *= 1.2;
		name = map[? BUFF_MAP.NAME]; //Grab the name
		scDrawText(tab_w + ((_w + tab_buf) / 2), _yy - tab_buf, name, c_yellow, 0.5, noone, alpha, fa_middle, fa_middle); //Buff name
		if (mouse_check_button_pressed(mb_left)) {
			tab_map[? "apply"] = true;
			tab_map[? "buffs_type"] = map[? BUFF_MAP.TYPE];
		}
	}
	
	scDrawSpriteExt(rx, ry, spr, 0, noone, alpha, scale, scale); //Buff icon
	ds_map_destroy(map);
	index ++;
}