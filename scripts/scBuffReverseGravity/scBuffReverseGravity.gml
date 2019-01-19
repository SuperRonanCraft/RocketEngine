///@desc The "BleedOut" Buff (Most effective with non damaging rockets)
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock = 0)
	owner.grv_dir *= -1;
	owner.image_yscale = owner.grv_dir;

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff and damage player
	owner.grv_dir *= -1;
	owner.image_yscale = owner.grv_dir;
	scBuffRemove(owner, dsBuff);
} else {
	part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
		dsBuff[? BUFF_MAP.PARTICLE], irandom_range(2,4));
	dsBuff[? BUFF_MAP.CLOCK]++;
}