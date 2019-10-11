/// @desc Buffs Draw GUI

var _yy = tab_cur_yy - tab_buf - (tab_buf / 2);

scDrawRectRound(tab_w + tab_buf, _yy, tab_w + tab_buf + RES_W / 4, _yy + RES_H / 4, c_white, false, 1, 8, 8);

var columns = 6, offset = 0, index = 0, scale, map, spr, rx, ry;//, name;
for (var i = 0; i < BUFFTYPE.LENGHT; i++) {
	if (index mod columns == 0)
		offset++;
	map = ds_map_create();
	scale = 0.6;
	scBuffGet(i, map); //Grab the buff map
	if (!map[? BUFF_MAP.ENABLED]) { ds_map_destroy(map); continue; }
	spr = map[? BUFF_MAP.ICON]; //Grab the icon
	//name = map[? BUFF_MAP.NAME]; //Grab the name
	var size = (64 * scale)
	rx = tab_w + tab_buf + (tab_buf + ((size + 4) * index)) - ((offset - 1) * ((size + 4) * columns));
	ry = _yy + tab_buf + (offset - 1) * (size + 4);
	
	if (scUIHoveringBox(rx, ry, rx + size, ry + size, 0, 0)) {
		scale *= 1.2;
		if (!ds_map_empty(tab_map) && mouse_check_button_pressed(mb_left)) {
			tab_map[? "apply"] = true;
			tab_map[? "type"] = map[? BUFF_MAP.TYPE];
		}
	}
	
	//scDrawText(rx, ry, name, c_black, 0.3); //Buff name
	scDrawSpriteExt(rx, ry, spr, 0, noone, 1, scale, scale); //Buff icon
	ds_map_destroy(map);
	index ++;
}