///@desc The "UltCharge" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[? BUFF_MAP.CLOCK];

//When the buff firt starts, apply the buff
if (clock = 0)
	owner.ult_charge_multiplier *= dsBuff[? "multiplier"];

//If the internal clock reaches the time in seconds, expire
if (clock > dsBuff[? BUFF_MAP.TIME]) {
	owner.ult_charge_multiplier /= dsBuff[? "multiplier"];
	scBuffRemove(owner, dsBuff);
} else {
	part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
	dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
	dsBuff[? BUFF_MAP.CLOCK]++;
}