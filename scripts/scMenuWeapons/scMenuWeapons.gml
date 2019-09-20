var amt = WEAPON_MODIFIER.LENGTH, columns = 2, rows = 3, offset = 0;
var pg = page_weapons;
var spr, name, desc, rx, ry, c, index = 0;

var newi = (pg * (columns * rows));
for (var i = newi; index < columns * rows && i < amt; i++) {
	if (index mod columns == 0)
		offset++;
	var spr = scWeaponModifyGetType(i, WEAPON_MODIFIER_MAP.ICON);
	var name = scWeaponModifyGetType(i, WEAPON_MODIFIER_MAP.NAME);
	var desc = scWeaponModifyGetType(i, WEAPON_MODIFIER_MAP.DESCRIPTION);
	var rx = ((RES_W / 3) + ((RES_W / 3) * index)) - ((offset - 1) * ((RES_W / 3) * columns));
	var ry = offset * 130 + 50;
	var c = color_element;
	var yoffset = 0;
	if (scUIHovering(rx, ry + 30, name, x_buffer * 2, 45, scale_element, fa_middle)) {
		c = color_main_hovering;
		yoffset = scMovementWave(-3, 3, 1);
		if (mouse_check_button_pressed(mb_left))
			with (oPlayer)
				scWeaponModify(id, i);
	}
	scDrawText(rx, ry, name, c, scale_element); //NAME
	draw_sprite(spr, 0, rx - 32, ry + 10 + yoffset); //ICON
	scDrawText(rx, ry + 84, desc, color_element_input, scale_description); //DESC
	scDrawLine(rx - 64, ry + 106, rx + 64, ry + 106, c_black, 2, 1);
	index++;
}

var max_page = 0;
while (amt - (((max_page + 1) * (columns * rows)) + 1) > 0)
	max_page++;
scDrawText(RES_W - (RES_W / 8), RES_H - (RES_H / 8), "Page " + string(pg + 1) + "/" + string(max_page + 1), color_element, scale_element);
scDrawText(RES_W / 2, RES_H / 8 + (RES_H / 32), "WEAPON MODIFIERS", c_orange, 1.5);