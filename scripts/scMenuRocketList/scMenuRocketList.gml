var amt = ROCKET.LENGHT, columns = 4, rows = 3, offset = 0;
var pg = page_rockets;
var spr, name, desc, buffs, rx, ry, c, yoffset, index = 0, ioffset = ROCKET.DEFAULT;

var disabled = 0;
for (var i = 0; i < amt; i++) {
	var roc_map = scRocketGet(i);
	if (!roc_map[? ROCKET_MAP.ENABLED])
		disabled++;
	ds_map_destroy(roc_map);
}

for (var i = (pg * (columns * rows) + (pg > 0 ? disabled : 0)) + ioffset; index < ((pg * (columns * rows)) + ioffset) + (columns * rows) - disabled && i < amt; i++) {
	var roc_map = scRocketGet(i);
	if (!roc_map[? ROCKET_MAP.ENABLED]) {ds_map_destroy(roc_map); continue;} //Is it disabled?
	if (index mod columns == 0)
		offset++;
	var spr = roc_map[? ROCKET_MAP.PROJECTILE];
	var name = roc_map[? ROCKET_MAP.NAME];
	var desc = roc_map[? ROCKET_MAP.DESCRIPTION];
	var buffs = roc_map[? ROCKET_MAP.BUFF];
	var rx = ((RES_W / 8) + ((RES_W / 4) * index)) - ((offset - 1) * ((RES_W / 4) * columns));
	var ry = offset * 130 + 50;
	var c = color_element;
	var yoffset = 0;
	if (scUIHovering(rx, ry + 20, name, x_buffer, 34, scale_element, fa_middle)) {
		c = color_main_hovering;
		yoffset = scMovementWave(-3, 3, 1);
		if (mouse_check_button_pressed(mb_left))
			with (oPlayer)
				scRocketChange(roc_map[? ROCKET_MAP.TYPE]);
	}
	scDrawText(rx, ry, name, c, scale_element); //Rocket name
	draw_sprite(spr, 0, rx, ry + 30 + yoffset); //Rocket icon
	if (buffs != noone) { //Rocket buffs if exists
		var bamt = array_length_1d(buffs);
		for (var b = 0; b < bamt; b++) {
			var map = ds_map_create();
			scBuffGet(buffs[b], map);
			draw_sprite_ext(map[? BUFF_MAP.ICON], 0, rx - (bamt * 20) + (40 * b) + 4, ry + 70, 0.5, 0.5, 0, c_white, 1);
			ds_map_destroy(map);
		}
	}
	scDrawText(rx, ry + 60, desc, color_element_input, scale_description); //Rocket Description
	draw_line_width_color(rx - 64, ry + 106, rx + 64, ry + 106, 2, c_black, c_black);
	ds_map_destroy(roc_map);
	index++;
}

var max_page = 0;
while (amt - (((max_page + 1) * (columns * rows)) + 1) > 0)
	max_page++;
scDrawText(RES_W - (RES_W / 8), RES_H - (RES_H / 8), "Page " + string(pg + 1) + "/" + string(max_page + 1), color_element, scale_element);