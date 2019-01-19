///@desc The "BleedOut" Buff (Most effective with non damaging rockets)
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

if (dsBuff[? BUFF_MAP.CLOCK] > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff and damage player
	scBuffRemove(owner, dsBuff);
} else {
	if (dsBuff[? "current_delay"] > dsBuff[? "delay"])
		if (dsBuff[? "current_duration"] > dsBuff[? "duration"]) {
			dsBuff[? "current_delay"] = 0;
			dsBuff[? "current_duration"] = 0;
		} else {
			owner.vsp_move -= dsBuff[? "vsp"]; 
			dsBuff[? "current_duration"]++;
			part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
				dsBuff[? BUFF_MAP.PARTICLE], irandom_range(2,4));
		}
	else
		dsBuff[? "current_delay"]++;
	dsBuff[? BUFF_MAP.CLOCK]++;
}