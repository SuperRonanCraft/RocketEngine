if (!display) exit;

//-----------------
//Display health
hp_scale = max(hp_scale * 0.95, 1);
var offset = 0;
for (var i = 0; i < hp_original; i++) {
	//Offset every 10 hearts
	if (i mod 10 == 0)
		offset++;
	//Determine side to display and offset every heart (mirrored)
	var len = (hpwidth + 1) * (i - ((offset - 1) * 10));
	var xpos = team == TEAM.LEFT ? 20 + len : RES_W - 20 - len;
	//Change every 10 hearts
	var ypos = offset * (hpheight + 2);
	var scale = i == hp ? hp_scale : 1;
	draw_sprite_ext(hpsprite, hp > i ? 0 : 1, xpos, ypos, scale, scale, 0, c_white, 0.8);
}
//-----------------
//Display Buffs and Time
offset = 0;
for (var i = 0; i < ds_list_size(buffs); i++) {
	//Grab the buff map
	var ds_list = buffs[| i];
	//Offset every 10 buffs
	if (i mod 10 == 0)
		offset++;
	//The icon set in the buff
	var sprite = ds_list[? BUFF_MAP.ICON];
	//Dimentions of sprite
	var w = sprite_get_width(sprite);
	var h = sprite_get_height(sprite);
	//Alpha of icon (wearing off after 75% of the buff has progressed)
	//var per = (ds_list[? BUFF_MAP.CLOCK] / ds_list[? BUFF_MAP.TIME])
	//var alpha = (per > 0.75) ? (per - 0.75) * 400 : 0;
	//Determine side and offset related to how many buffs to display (2 pixels between each icon) (mirrored)
	var xpos = team == TEAM.LEFT ? (RES_W / 2) - (w) - (((w / 2) + 6) * i) : (RES_W / 2) + (w / 2) + (((w / 2) + 6) * i);
	var ypos = offset * (h / 2 + 2) + (RES_H / 32);
	
	//BUFF TIME
	var time = ds_list[? BUFF_MAP.TIME] - ds_list[? BUFF_MAP.CLOCK];
	var maxtime = ds_list[? BUFF_MAP.TIME];
	scDrawPieRect(xpos + (w / 4), ypos + (h / 4), time, maxtime, c_dkgray, (w / 4) + 3, 0.8);
	
	//BUFF ICON
	draw_sprite_ext(sprite, 0, xpos, ypos, 0.5, 0.5, 0, c_white, 0.8);// - (alpha / 100));
}
//Display Rocket Equipped, Cooldown and Ultimate Charge
if (rocket_map[? ROCKET_MAP.TYPE] != ROCKET.NONE) {
	//The projectile sprite
	var sprite = rocket_map[? ROCKET_MAP.PROJECTILE];
	//Dimentions of sprite
	var w = sprite_get_width(sprite);
	var h = sprite_get_height(sprite);
	//determine side
	var xpos = team == TEAM.LEFT ? RES_W / 4 - w / 3 : RES_W / 2 + RES_W / 4 + w / 3;
	var ypos = h / 2;
	
	var c = c_dkgray;
	for (var i = 0; i < ds_list_size(buffs); i++) {
		//Grab the buff map
		var ds_list = buffs[| i];
		//Is the buff a cooldown?
		if (ds_list[? BUFF_MAP.TYPE] == BUFFTYPE.COOLDOWN)
			c = c_green;
	}
	var cd = ammo == 0 ? rocket_map[? ROCKET_MAP.RELOAD_TIME] : rocket_map[? ROCKET_MAP.COOLDOWN];
	var curr_cd = ammo == 0 ? current_reload : current_cd;
	var xposcir = xpos + (team == TEAM.LEFT ? -(w / 8) : (w / 8));
	
	//ROCKET COOLDOWN
	scDrawPie(xposcir, ypos, curr_cd, cd, c, 20, 0.8);
	
	//ULTIMATE CHARGE CIRCLE
	if (ult_enabled) {
		var charge = round(ult_charge * (100 / ult_charge_max));
		var c = make_color_rgb(255 * clamp(min(((75 - charge) / 25), 1), 0, 1), 255 * clamp(max((charge - 25) / 100, 0), 0, 1), 0);
		scDrawPiePart(xposcir, ypos, ult_charge, ult_charge_max, c, 28, 0.8, 9);
	
		//ULTIMATE CASTTIME CIRCLE
		scDrawPiePart(xposcir, ypos, ult_cast_time_max - ult_cast_time, ult_cast_time_max, c_yellow, 32, 0.9, 4);
	
		//ULTIMATE CHARGE TEXT
		scDrawText(xposcir, ypos * 2, string(charge) + string("%"), c_ltgray, 0.5, noone, 0.8);
	}
	//ROCKET EQUIPPED
	draw_sprite_ext(sprite, 0, xpos, ypos, (team == TEAM.LEFT ? 1 : -1) * rocket_scale, 1 * rocket_scale, 0, c_white, 0.8);
	//Make the scale smaller over time
	rocket_scale = max(rocket_scale * 0.95, 1);
}
//Combos
if (combo_amount > 1) {
	var xpos = team == TEAM.LEFT ? 50 : RES_W - 50;
	var align = team == TEAM.LEFT ? fa_left : fa_right;
	var ctext = "x" + string(combo_amount) + " " + combo_text_current;
	scDrawText(xpos, 50, ctext, c_yellow, combo_scale * 0.5, noone, noone, align);
}