///@desc The "BleedOut" Buff (Most effective with non damaging rockets)
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock = 0)
	owner.knockback_multiplier *= dsBuff[? "multiplier"];

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff and damage player
	owner.knockback_multiplier /= dsBuff[? "multiplier"];
	scBuffRemove(owner, dsBuff);
} else {
	part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
		dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
	dsBuff[? BUFF_MAP.CLOCK]++;
}