///@desc The "Cleanse" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff
	scBuffRemove(owner, dsBuff);
} else {
	if (dsBuff[? "parts_crt"] <= 0) {
		part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
			dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
		dsBuff[? "parts_crt"] = dsBuff[? "parts_amt"];
	} else
		dsBuff[? "parts_crt"]--;
	
	for (var i = 0; i < ds_list_size(owner.buffs_map); i++)	{
		var buff = owner.buffs_map[| i];
		if (buff != dsBuff && !buff[? BUFF_MAP.GOOD])
			buff[? BUFF_MAP.CLOCK] = buff[? BUFF_MAP.TIME] + 1;
	}
	
	dsBuff[? BUFF_MAP.CLOCK]++;
}