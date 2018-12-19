var amt = ROCKET.LENGHT, columns = 4, offset = 0;
for (var i = 1; i < amt; i++) {
	var map = weapons[i];
	if (!is_undefined(map[? ROCKET_MAP.ENABLED]) && !map[? ROCKET_MAP.ENABLED]) continue; //Is it disabled?
	if ((i - 1) mod columns == 0)
		offset++;
	var spr = map[? ROCKET_MAP.PROJECTILE];
	var name = map[? ROCKET_MAP.NAME];
	var desc = map[? ROCKET_MAP.DESCRIPTION];
	var buffs = map[? ROCKET_MAP.BUFF];
	var rx = ((RES_W / 8) + ((RES_W / 4) * (i - 1))) - ((offset - 1) * ((RES_W / 4) * columns));
	var ry = offset * 130 + 40;
	scDrawText(rx, ry, name, color_element, scale_element); //Rocket name
	draw_sprite(spr, 0, rx, ry + 30); //Rocket icon
	if (!is_undefined(buffs)) { //Rocket buffs if exists
		var bamt = array_length_1d(buffs);
		for (var b = 0; b < bamt; b++) {
			var map = ds_map_create();
			scGetBuff(buffs[b], map);
			draw_sprite_ext(map[? BUFF_MAP.ICON], 0, rx - (bamt * 20) + (40 * b) + 4, ry + 70, 0.5, 0.5, 0, c_white, 1);
			ds_map_destroy(map);
		}
	}
	scDrawText(rx, ry + 60, desc, color_element_input, scale_description); //Rocket Description
	draw_line_width_color(rx - 64, ry + 106, rx + 64, ry + 106, 2, c_black, c_black);
}