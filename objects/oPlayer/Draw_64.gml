/// @desc GUI for player hp, rockets and ults
if (!display) exit;

//-----------------
//Display health
hp_scale = max(hp_scale * 0.95, 1);
//var offset = 0;
for (var i = 0; i < hp_original; i++) {
	//Show first ten hearts, then show additional hearts in text
	if (i < 10) {
		var len = hpwidth * i//((offset - 1) * 10));
		var xpos = team == TEAM.LEFT ? 20 + len : RES_W - 20 - len;
		var ypos = (hpheight + 2); //+ (offset > 1 ? (offset == 2 ? hpheight + 2 : ((offset - 2) * (hpheight / 1.5)) + (hpheight + 2)) : 0);
		var scale = i == hp ? hp_scale : 1;
		draw_sprite_ext(hpsprite, hp > i ? 0 : 1, xpos, ypos, scale, scale, 0, c_white, 0.8);
	} else {
		if (hp < 10) break;
		var str = "+" + string(hp - i);
		var xpos = team == TEAM.LEFT ? 20 + (hpwidth * 8) : RES_W - 20 - (hpwidth * 8);
		var ypos = hpheight + 10;
		c = hp_scale == 1 ? c_white : c_red;
		scDrawText(xpos, ypos, str, c, hp_scale / 2, noone, 0.65, team == TEAM.LEFT ? fa_left : fa_right);
		break;
	}
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
	//Determine side and offset related to how many buffs to display (2 pixels between each icon) (mirrored)
	var xpos = team == TEAM.LEFT ? (RES_W / 2) - (w) - (((w / 2) + 8) * (i - ((offset - 1) * 10))) : (RES_W / 2) + (w / 2) + (((w / 2) + 8) * (i - ((offset - 1) * 10)));
	var ypos = offset * (h / 2 + 2) + (RES_H / 32);
	
	//BUFF TIME
	var time = ds_list[? BUFF_MAP.TIME] - ds_list[? BUFF_MAP.CLOCK];
	var maxtime = ds_list[? BUFF_MAP.TIME];
	scDrawPieRect(xpos + (w / 4), ypos + (h / 4), time, maxtime, c_dkgray, (w / 4) + 4, 0.65);
	
	//BUFF ICON
	draw_sprite_ext(sprite, 0, xpos, ypos, 0.5, 0.5, 0, c_white, 0.55);
	scDrawText(xpos + w / 2, ypos + h / 2, string(ceil(time / room_speed)), c_gray, 0.45);
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
	if (rocket_map[? ROCKET_MAP.BUFF] != noone) {
		var buffy = RES_H / 16;
		var buffx = xpos + (team == TEAM.LEFT ? 32 : -50);
		var buffsid = rocket_map[? ROCKET_MAP.BUFF];
		if (is_array(buffsid))
			for (var i = 0; i < array_length_1d(buffsid); i++) {
				var buff_map = ds_map_create();
				scBuffGet(buffsid[i], buff_map);
				draw_sprite_ext(buff_map[? BUFF_MAP.ICON], 0, buffx, buffy, 0.3, 0.3, 0, c_white, rockets_enabled ? 0.5 : 0.2);
				buffx += (team == TEAM.LEFT ? 22 : -22);
				ds_map_destroy(buff_map);
			}
		else {
			var buff_map = ds_map_create();
			scBuffGet(buffsid, buff_map);
			draw_sprite_ext(buff_map[? BUFF_MAP.ICON], 0, buffx, buffy, 0.3, 0.3, 0, c_white, rockets_enabled ? 0.5 : 0.2);
			ds_map_destroy(buff_map);
		}
	}
			
		
	
	var xposcir = xpos + (team == TEAM.LEFT ? -(w / 8) : (w / 8));
	
	//ROCKET COOLDOWN
	if (rockets_enabled) {
		var cd = ammo == 0 ? rocket_map[? ROCKET_MAP.RELOAD_TIME] : rocket_map[? ROCKET_MAP.COOLDOWN];
		var curr_cd = ammo == 0 ? current_reload : current_cd;
		scDrawPie(xposcir, ypos, curr_cd, cd, c, 20, 0.8);
	}
	
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
	draw_sprite_ext(sprite, 0, xpos, ypos, (team == TEAM.LEFT ? 1 : -1) * rocket_scale, 1 * rocket_scale, 0, c_white, rockets_enabled ? 0.8 : 0.3);
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