/// @desc GUI for player hp, rockets and ults
//if (!display) exit;

//-----------------
//Display health
var hppart = hp mod 10 / 10;
for (var i = 0; i < hp_original / 10; i++) {
	//Show first ten hearts, then show additional hearts in text
	if (i < 10) {
		var len = hpwidth * i//((offset - 1) * 10));
		var side = team == TEAM.LEFT ? 1 : -1;
		var xpos = side == 1 ? 20 + len : RES_W - 20 - len;
		var ypos = hpheight + 2; //+ (offset > 1 ? (offset == 2 ? hpheight + 2 : ((offset - 2) * (hpheight / 1.5)) + (hpheight + 2)) : 0);
		var scale = i * 10 <= hp + (hp_damaged - 1) && i * 10 > hp - 10 ? hp_scale : 1;
		if (hppart != 0 && i == (hp - (hppart * 10)) / 10) {
			var alpha = 0.9;
			var amt = 1;
			var c = c_white;
			if (hp_flash_alpha > 0) //shader
				amt = 2;
			for (var a = 0; a < amt; a++) {
				if (a == 1) { //shader
					shader_set(shFlashAlpha);
					alpha = hp_flash_alpha;
					c = c_red;
				} else {
					xpos -= ((hpwidth * scale) / 2);
					ypos -= (hpwidth * scale) / 2;
				}
				draw_sprite_part_ext(hpsprite, 0, 0, 0, hpwidth * hppart, hpheight, 
					xpos, ypos, scale, scale, c, alpha);
				draw_sprite_part_ext(hpsprite, 1, hpwidth * hppart, 0, hpwidth - (hpwidth * hppart), hpheight,
					xpos + (hpwidth * (scale - 1)) + (hpwidth * hppart), ypos, scale, scale, c_white, alpha);
			}
			if (hp_flash_alpha > 0) //shader
				shader_reset();
		} else {
			draw_sprite_ext(hpsprite, hp / 10 > i ? 0 : 1, xpos, ypos, scale, scale, 0, c_white, 0.8);
			scFlash(hp_flash_alpha, hp / 10 > i ? hp_flash_color : c_white, scale, scale, hpsprite, hp > i ? 0 : 1, xpos, ypos);
		}
	} else {
		if (hp < 100) break;
		var str = "+" + string((hp / 10) - i);
		var xpos = team == TEAM.LEFT ? 20 + (hpwidth * 8) : RES_W - 20 - (hpwidth * 8);
		var ypos = hpheight + 10;
		c = hp_scale == 1 ? c_white : c_red;
		scDrawText(xpos, ypos, str, c, hp_scale / 2, noone, 0.65, team == TEAM.LEFT ? fa_left : fa_right);
		break;
	}
}
hp_scale = max(hp_scale * 0.95, 1);
hp_flash_alpha = max(hp_flash_alpha - hp_flash_reduce, 0);
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
	var xpos = team == TEAM.LEFT ? (RES_W / 2) - (w) - (((w / 2) + 8) * (i - ((offset - 1) * 10)))
		: (RES_W / 2) + (w / 2) + (((w / 2) + 8) * (i - ((offset - 1) * 10)));
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
		if (charge >= 100) {
			var ang = irandom_range(0, 360);
			scDrawLightning(xposcir, ypos, xposcir + lengthdir_x(32, ang), ypos + lengthdir_y(32, ang), irandom(5), c_blue);
		}
		var c = make_color_rgb(255 * clamp(min(((75 - charge) / 25), 1), 0, 1), 255 * clamp(max((charge - 25) / 100, 0), 0, 1), 0);
		scDrawPiePart(xposcir, ypos, ult_charge, ult_charge_max, c, 28, 0.8, 9);
	
		//ULTIMATE CASTTIME CIRCLE
		scDrawPiePart(xposcir, ypos, ult_cast_time_max - ult_cast_time, ult_cast_time_max, c_yellow, 32, 0.9, 4);
	
		//ULTIMATE CHARGE TEXT
		scDrawText(xposcir, ypos * 2, string(charge) + "%", charge < 100 ?  c_ltgray : c_yellow,
			0.5, noone, charge < 100 ? 0.8 : scMovementWave(0.8, 0.4, 1));
		if (charge >= 100) {
			if (!ult_justReady) {
				ult_justReady = true;
				ult_loc_x = x;
				ult_loc_y = bbox_top;
				ult_loc_alpha = 1;
				ult_loc_timer_cur = 0;
			}
			
			if (ult_loc_alpha > 0) {
				scDrawText(ult_loc_x, ult_loc_y, "Ultimate ready!", c_yellow, 0.5, noone, ult_loc_alpha);
				ult_loc_y -= 2 / TIME_SPEED;
				ult_loc_alpha = max(ult_loc_alpha - (0.04 / TIME_SPEED), 0);
			}
			
			var str = scKeyToString(keyleft) + " + " + scKeyToString(keyright);
			scDrawText(xposcir, ypos * 2 + (string_height(str) * 0.5), str, c_yellow, 
				0.5, noone, scMovementWave(0.8, 0.4, 1));
		} else
			ult_justReady = false;
	}
	//ROCKET EQUIPPED
	draw_sprite_ext(sprite, 0, xpos, ypos, (team == TEAM.LEFT ? 1 : -1) * rocket_scale, 1 * rocket_scale, 0, 
		c_white, rockets_enabled ? 0.8 : 0.3);
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
combo_scale = max(combo_scale * 0.95, 1); //Lower combo scale