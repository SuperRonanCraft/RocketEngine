/// @desc Weapons Draw GUI

var _yy = tab_y - tab_buf - (tab_buf / 2);

var _scale_o = 0.6; //Original Scale
var columns = 3, offset = 0, index = 0, _buff = 4, size = (64 * _scale_o), scale, spr, rx, ry;//, name;
var _w = columns * ((64 * _scale_o) + _buff) + (tab_buf * 2); //Width
var _h = (ceil(WEAPON_MODIFIER.LENGTH / columns) * (size)) + (tab_buf * 2) + (_buff * (ceil(WEAPON_MODIFIER.LENGTH / columns) - 1));

scDrawRectRound(tab_w + tab_buf, _yy, tab_w + _w, _yy + _h, c_white, false, alpha, 8, 8);

for (var i = 0; i < WEAPON_MODIFIER.LENGTH; i++) {
	if (index mod columns == 0)
		offset++;
	scale = _scale_o;
	//name = scWeaponModifyGetType(i, WEAPON_MODIFIER_MAP.NAME);
	spr = scWeaponModifyGetType(i, WEAPON_MODIFIER_MAP.ICON); //Grab the icon
	rx = tab_w + tab_buf + (tab_buf + ((size + _buff) * index)) - ((offset - 1) * ((size + _buff) * columns));
	ry = _yy + tab_buf + (offset - 1) * (size + _buff);
	
	if (scUIHoveringBox(rx, ry, rx + size, ry + size, 0, 0)) {
		scale *= 1.2;
		if (!ds_map_empty(tab_map) && mouse_check_button_pressed(mb_left)) {
			tab_map[? "apply"] = true;
			tab_map[? "weapon_type"] = i;
		}
	}
	
	//scDrawText(rx, ry, name, c_black, 0.3); //Buff name
	scDrawSpriteExt(rx + (size / 2), ry + (size / 2), spr, 0, noone, alpha, scale, scale); //Buff icon
	index ++;
}