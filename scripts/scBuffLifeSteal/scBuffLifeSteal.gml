///@desc The "Life-Steal" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

if (dsBuff[? BUFF_MAP.CLOCK] == 0) {
	dsBuff[? "players_hit"] = ds_list_create();
	dsBuff[? "sprite"] = s_pdrainlife;
	dsBuff[? "image_index_max"] = sprite_get_number(dsBuff[? "sprite"]) - 1;
	dsBuff[? "image_speed"] = sprite_get_speed(dsBuff[? "sprite"]);
}

if (dsBuff[? BUFF_MAP.CLOCK] > dsBuff[? BUFF_MAP.TIME]) { //Remove buff
	scBuffRemove(owner, dsBuff);
} else {
	if (dsBuff[? "parts_crt"] <= 0) {
		part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
			dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
		dsBuff[? "parts_crt"] = dsBuff[? "parts_amt"];
	} else
		dsBuff[? "parts_crt"]--;
	
	dsBuff[? BUFF_MAP.CLOCK]++;
}