var amt = BUFFTYPE.LENGHT, columns = 3, rows = 3, offset = 0;
var pg = page_buffs;
var map, spr, name, desc, part, part_amt, rx, ry, c, yoffset, index = 0;
for (var i = (pg * (columns * rows)); index < columns * rows && i < amt; i++) {
	if (index mod columns == 0)
		offset++;
	map = ds_map_create();
	scBuffGet(i, map); //Grab the buff map
	if (!map[? BUFF_MAP.ENABLED]) { ds_map_destroy(map); continue; }
	spr = map[? BUFF_MAP.ICON]; //Grab the icon
	name = map[? BUFF_MAP.NAME]; //Grab the name
	desc = map[? BUFF_MAP.DESCRIPTION]; //Grab the description
	part = map[? BUFF_MAP.PARTICLE]; //Grab the particle
	part_amt = map[? BUFF_MAP.PARTICLE_AMT]; //Grab the amount of particles
	rx = ((RES_W / 4) + ((RES_W / 4) * index)) - ((offset - 1) * ((RES_W / 4) * columns));
	ry = offset * 150 + 10;
	c = color_element;
	yoffset = 0;
	if (scUIHovering(rx, ry + 40, name, x_buffer, 65, scale_element, fa_middle)) {
		c = color_main_hovering; yoffset = scMovementWave(-3, 3, 1);
		part_amt *= 2;
		if (mouse_check_button_pressed(mb_left))
			scBuffAdd(map[? BUFF_MAP.TYPE], oPlayer, oPlayer);
	}
	scDrawText(rx, ry, name, c, scale_element); //Buff name
	//Particles
	part_emitter_region(global.ParticleSystem1, global.Emitter1, rx - 42, rx + 42,
		ry + 94, ry + 74, ps_shape_rectangle, ps_distr_linear)
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, part, part_amt);
	draw_sprite(spr, 0, rx - 32, ry + 20 + yoffset); //Buff icon
	var time = map[? BUFF_MAP.TIME] != noone ? ceil(map[? BUFF_MAP.TIME] / room_speed) : "inf";
	scDrawText(rx + 32, ry + 84 + yoffset, string(time),
		c_ltgray, 0.6, noone, 0.8, fa_left, fa_top); //Buff time
	scDrawText(rx, ry + 110, desc, color_element_input, 0.45); //Buff description
	scDrawLine(rx - 64, ry + 122, rx + 64, ry + 122, c_black, 2, 1);
	//draw_line_width_color(rx - 64, ry + 122, rx + 64, ry + 122, 2, c_black, c_black); //Seperator line
	ds_map_destroy(map);
	index++;
}

var max_page = 0;
while (amt - (((max_page + 1) * (columns * rows)) + 1) > 0)
	max_page++;
scDrawText(RES_W - (RES_W / 8), RES_H - (RES_H / 8), "Page " + string(pg + 1) + "/" + string(max_page + 1), color_element, scale_element);

scDrawText(RES_W / 2, RES_H / 8 + (RES_H / 32), "BUFFS", c_orange, 1.5);