var amt = ROCKET.LENGHT, columns = 4, offset = 0;
var index = 0;
for (var i = 1; i < amt; i++) {
	var roc_map = scRocketGet(i);
	if (!is_undefined(roc_map[? ROCKET_MAP.ENABLED]) && !roc_map[? ROCKET_MAP.ENABLED]) continue; //Is it disabled?
	if (index mod columns == 0)
		offset++;
	var spr = roc_map[? ROCKET_MAP.PROJECTILE];
	var name = roc_map[? ROCKET_MAP.NAME];
	var desc = roc_map[? ROCKET_MAP.DESCRIPTION];
	var buffs = roc_map[? ROCKET_MAP.BUFF];
	var rx = ((RES_W / 8) + ((RES_W / 4) * (index))) - ((offset - 1) * ((RES_W / 4) * columns));
	var ry = offset * 130 + 40;
	var c = color_element;
	var yoffset = 0;
	if (scUIHovering(rx, ry, name, x_buffer, 10, scale_element, true)) {
		c = color_main_hovering; yoffset = scMovementWave(-2, 2, 1);}
	scDrawText(rx, ry, name, c, scale_element); //Rocket name
	draw_sprite(spr, 0, rx, ry + 30 + yoffset); //Rocket icon
	if (!is_undefined(buffs)) { //Rocket buffs if exists
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