var amt = BUFFTYPE.LENGHT, columns = 3, offset = 0;
for (var i = 0; i < amt; i++) {
	if (i mod columns == 0)
		offset++;
	var map = ds_map_create();
	scBuffGet(i, map); //Grab the buff map
	var spr = map[? BUFF_MAP.ICON]; //Grab the icon
	var name = map[? BUFF_MAP.NAME]; //Grab the name
	var desc = map[? BUFF_MAP.DESCRIPTION]; //Grab the description
	var part = map[? BUFF_MAP.PARTICLE]; //Grab the particle
	var part_amt = map[? BUFF_MAP.PARTICLE_AMT]; //Grab the amount of particles
	var rx = ((RES_W / 4) + ((RES_W / 4) * i)) - ((offset - 1) * ((RES_W / 4) * columns));
	var ry = offset * 150 + 10;
	var c = color_element;
	var yoffset = 0;
	if (scUIHovering(rx, ry + 40, name, x_buffer, 65, scale_element, true)) {
			c = color_main_hovering; yoffset = scMovementWave(-2, 2, 1);}
	scDrawText(rx, ry, name, c, scale_element); //Buff name
	//Particles
	part_emitter_region(global.ParticleSystem1, global.Emitter1, rx - 42, rx + 42,
		ry + 94, ry + 74,
		ps_shape_rectangle, ps_distr_linear)
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, part, part_amt);
	draw_sprite(spr, 0, rx - 32, ry + 20 + yoffset); //Buff icon
	scDrawText(rx, ry + 110, desc, color_element_input, 0.45); //Buff description
	draw_line_width_color(rx - 64, ry + 122, rx + 64, ry + 122, 2, c_black, c_black); //Seperator line
	ds_map_destroy(map);
}