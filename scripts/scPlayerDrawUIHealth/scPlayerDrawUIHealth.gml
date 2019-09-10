//DRAW PLAYER HEALTH
var map = player_map;
var hppart = shootable_map[? SHOOTABLE_MAP.HEALTH] mod 2 / 2;
if (shootable_map[? SHOOTABLE_MAP.HEALTH] <= 2)
	hp_offset = scMovementWave(-3, 3, 1);
else
	hp_offset = 0;
for (var i = 0; i < shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL] / 2; i++) {
	//Show first ten hearts, then show additional hearts in text
	if (i < 10) {
		var len = hpwidth * i;
		var side = team == TEAM.LEFT ? 1 : -1;
		var xpos = (side == 1 ? 20 + len : RES_W - 20 - len) + hp_offset;
		var ypos = hpheight + 2;
		var scale = i * 2 <= shootable_map[? SHOOTABLE_MAP.HEALTH] + (map[? PLAYER_MAP.DAMAGE_LAST] - 1) && i * 2 > shootable_map[? SHOOTABLE_MAP.HEALTH] - 2 ? hp_scale : 1;
		var c = shootable_map[? SHOOTABLE_MAP.HEALTH] / 2 <= i ? c_white : hp_color;
		if (hppart != 0 && i == (shootable_map[? SHOOTABLE_MAP.HEALTH] - (hppart * 2)) / 2) {
			var alpha = 0.9;
			var amt = 1;
			if (map[? PLAYER_MAP.FLASH_HEALTH_ALPHA] > 0) //shader
				amt = 2;
			for (var a = 0; a < amt; a++) {
				if (a == 1) { //shader
			 		shader_set(shFlashAlpha);
					alpha = map[? PLAYER_MAP.FLASH_HEALTH_ALPHA];
					c = map[? PLAYER_MAP.FLASH_HEALTH_COLOR];
				} else {
					xpos -= ((hpwidth * scale) / 2);
					ypos -= (hpwidth * scale) / 2;
				}
				draw_sprite_part_ext(hpsprite, side == 1 ? 0 : 1, 0, 0, hpwidth * hppart, hpheight, 
					xpos, ypos, scale, scale, side != 1 ? c_white : c, alpha);
				draw_sprite_part_ext(hpsprite, side != 1 ? 0 : 1, hpwidth * hppart, 0, hpwidth - (hpwidth * hppart), hpheight,
					xpos + (hpwidth * hppart * scale), ypos, scale, scale, side == 1 ? c_white : c, alpha);
			}
			if (map[? PLAYER_MAP.FLASH_HEALTH_ALPHA] > 0) //shader
				shader_reset();
		} else {
			draw_sprite_ext(hpsprite, shootable_map[? SHOOTABLE_MAP.HEALTH] / 2 > i ? 0 : 1, xpos, ypos, scale, scale, 0, c, 0.8);
			scFlash(map[? PLAYER_MAP.FLASH_HEALTH_ALPHA], shootable_map[? SHOOTABLE_MAP.HEALTH] / 2 > i ? map[? PLAYER_MAP.FLASH_HEALTH_COLOR] : c_white, scale, scale, hpsprite, shootable_map[? SHOOTABLE_MAP.HEALTH] > i ? 0 : 1, xpos, ypos);
		}
	} else {
		if (shootable_map[? SHOOTABLE_MAP.HEALTH] < 20) break;
		var str = "+" + string(shootable_map[? SHOOTABLE_MAP.HEALTH] - i);
		var xpos = team == TEAM.LEFT ? 20 + (hpwidth * 8) : RES_W - 20 - (hpwidth * 8);
		var ypos = hpheight + 10;
		c = hp_scale == 1 ? c_white : c_red;
		scDrawText(xpos, ypos, str, c, hp_scale / 2, noone, 0.65, team == TEAM.LEFT ? fa_left : fa_right);
		break;
	}
}
hp_scale = max(hp_scale * 0.95, 1);
map[? PLAYER_MAP.FLASH_HEALTH_ALPHA] = max(map[? PLAYER_MAP.FLASH_HEALTH_ALPHA] - map[? PLAYER_MAP.FLASH_HEALTH_ALPHA_REDUCE], 0);