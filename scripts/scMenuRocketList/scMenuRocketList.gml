var amt = ds_list_size(rockets_list)/*ROCKET.LENGHT*/, columns = 4, rows = 3, offset = 0;
var pg = page_rockets;
var spr, name, desc, buffs, rx, ry, c, index = 0, ioffset = 0;//ROCKET.DEFAULT;

var disabled = 0;
/*for (var i = ioffset; i < amt; i++) {
	var roc_map = scRocketGet(i);
	if (!roc_map[? ROCKET_MAP.ENABLED])
		disabled++;
	ds_map_destroy(roc_map);
}*/

var newi = (pg * (columns * rows)) + ioffset + (pg > 0 ? disabled : 0);
for (var i = newi; index < columns * rows && i < amt; i++) {
	var roc_map = rockets_list[| i];//scRocketGet(i);
	//if (!roc_map[? ROCKET_MAP.ENABLED]) {/*ds_map_destroy(roc_map);*/ continue;} //Is it disabled?
	if (index mod columns == 0)
		offset++;
	var spr = roc_map[? ROCKET_MAP.PROJECTILE];
	var name = roc_map[? ROCKET_MAP.NAME];
	var desc = roc_map[? ROCKET_MAP.DESCRIPTION];
	var buffs = roc_map[? ROCKET_MAP.BUFF];
	var clip = roc_map[? ROCKET_MAP.CLIP];
	var dmg = roc_map[? ROCKET_MAP.DAMAGE];
	var rx = ((RES_W / 8) + ((RES_W / 4) * index)) - ((offset - 1) * ((RES_W / 4) * columns));
	var ry = offset * 130 + 50;
	var c = color_element;
	var img = 0;
	if (scUIHovering(rx, ry + 20, name, x_buffer, 34, scale_element, fa_middle)) {
		c = color_main_hovering;
		//yoffset = scMovementWave(-3, 3, 1);
		img = floor(rockets_img);
		if (mouse_check_button_pressed(mb_left))
			with (oPlayer)
				scRocketChange(roc_map[? ROCKET_MAP.TYPE]);
	}
	if (clip > 1) { //Show clip
		var lx = rx + 30;
		for (var d = 0; d < clip; d++) {
			var ly = ry + 20 + (5 * d);
			scDrawLine(lx, ly, lx + 10, ly, c_yellow, 2, 0.5);
		}
	}
	scDrawText(rx, ry, name, c, scale_element); //Rocket name
	draw_sprite(spr, img, rx, ry + 30); //Rocket icon
	if (buffs != noone) { //Rocket buffs if exists
		var bamt = array_length_1d(buffs);
		for (var b = 0; b < bamt; b++) {
			var map = ds_map_create();
			scBuffGet(buffs[b], map);
			draw_sprite_ext(map[? BUFF_MAP.ICON], 0, rx - (bamt * 20) + (40 * b) + 4, ry + 70, 0.5, 0.5, 0, c_white, 1);
			ds_map_destroy(map);
		}
	}
	if (dmg > 0) { //Show attack damage
		var scale = 0.5;
		var ly = ry + 35;
		var half = dmg mod 2;
		var dmgTime = dmg / 2 - half;
		var lx = rx + 20;
		for (var d = 0; d < dmgTime; d++) {
			scDrawSpriteExt(lx + 4, ly + 4, sHealth, 0, noone, 0.8, scale, scale);
			lx += 8;
		}
		if (half > 0) {
			draw_sprite_part_ext(sHealth, 0, 0, 0, 8, 16, lx, ly, scale, scale, c_white, 0.8);
			draw_sprite_part_ext(sHealth, 1, 8, 0, 8, 16, lx + 4, ly, scale, scale, c_white, 0.8);
		}
	}
	scDrawText(rx, ry + 60, desc, color_element_input, scale_description); //Rocket Description
	scDrawLine(rx - 64, ry + 106, rx + 64, ry + 106, c_black, 2, 1);
	//draw_line_width_color(rx - 64, ry + 106, rx + 64, ry + 106, 2, c_black, c_black);
	//ds_map_destroy(roc_map);
	index++;
}

var max_page = 0;
while (amt - (((max_page + 1) * (columns * rows)) + 1) > 0)
	max_page++;
scDrawText(RES_W - (RES_W / 8), RES_H - (RES_H / 8), "Page " + string(pg + 1) + "/" + string(max_page + 1), color_element, scale_element);

//animate hovering rocket
rockets_img += rockets_spd;
if (floor(rockets_img) > 3)
	rockets_img = 0;