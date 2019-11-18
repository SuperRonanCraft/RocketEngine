///@desc The "Absorbtion" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock == 0) {
	dsBuff[? "health_start"] = owner.shootable_map[? SHOOTABLE_MAP.HEALTH];
	dsBuff[? "sprite"] = sHealthBuff;
	dsBuff[? "width"] = sprite_get_width(sHealthBuff) - 3;
	dsBuff[? "alpha"] = 0.95;
}

if (clock > dsBuff[? BUFF_MAP.TIME] || dsBuff[? "health"] <= 0) { //Remove buff
	scBuffRemove(owner, dsBuff);
} else {
	if (dsBuff[? "parts_crt"] <= 0) {
		part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
			dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
		dsBuff[? "parts_crt"] = dsBuff[? "parts_amt"];
	} else
		dsBuff[? "parts_crt"]--;
		
	//DISPLAY HP
	var hppart = dsBuff[? "health"] mod 2 / 2;
	var index = 0, index_val = index;
	for (var i = 0; i < ds_list_size(owner.buffs_map); i++) {
		var buff = owner.buffs_map[| i];
		if (buff[? BUFF_MAP.TYPE] == dsBuff[? BUFF_MAP.TYPE]) {
			if (buff == dsBuff)
				index_val = index;
			index++;
		}
	}
	with (owner) {
		for (var i = 0; i < dsBuff[? "health"] / 2 && i < 10; i++) {
			var len = dsBuff[? "width"] * i;
			var side = team == TEAM.LEFT ? 1 : -1;
			var _xoff = health_map[? HEALTH_MAP.X] + len + dsBuff[? "width"];
			var xpos = (side == 1 ? _xoff : RES_W - _xoff) + (side * (index_val * (dsBuff[? "width"] * 2)));
			var ypos = (health_map[? HEALTH_MAP.Y] + (health_map[? HEALTH_MAP.HEIGHT]) + dsBuff[? "width"]);
			var scale = i * 2 <= shootable_map[? SHOOTABLE_MAP.HEALTH] + (player_map[? PLAYER_MAP.DAMAGE_LAST] - 1) && i * 2 > shootable_map[? SHOOTABLE_MAP.HEALTH] - 2 ? 1 : 1;
			if (hppart != 0 && i == (dsBuff[? "health"] - (hppart * 2)) / 2) {
				//var alpha = 0.9;
				//var amt = 1;
				//xpos -= ((hpwidth * scale) / 2);
				//ypos -= (hpwidth * scale) / 2;
				//draw_sprite_part_ext(hpsprite, side == 1 ? 2 : 1, 0, 0, hpwidth * hppart, hpheight, 
				//	xpos, ypos, scale, scale, c_white, alpha); 
				//draw_sprite_part_ext(hpsprite, side != 1 ? 2 : 1, hpwidth * hppart, 0, hpwidth - (hpwidth * hppart), hpheight,
				//	xpos + (hpwidth * hppart * scale), ypos, scale, scale, c_white, alpha);
				scDrawSpriteExt(xpos, ypos, dsBuff[? "sprite"], 1, c_white, dsBuff[? "alpha"], scale, scale);
			} else
				scDrawSpriteExt(xpos, ypos, dsBuff[? "sprite"], 0, c_white, dsBuff[? "alpha"], scale, scale);
		}
	}
	
	if (owner.shootable_map[? SHOOTABLE_MAP.HEALTH] > dsBuff[? "health_start"])
		dsBuff[? "health_start"] = owner.shootable_map[? SHOOTABLE_MAP.HEALTH];
	dsBuff[? BUFF_MAP.CLOCK]++;
}