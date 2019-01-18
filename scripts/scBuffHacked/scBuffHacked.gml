///@desc The "BleedOut" Buff (Most effective with non damaging rockets)
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock = 0) {
	dsBuff[? "toggleUlt"] = owner.ult_enabled;
	if (dsBuff[? "toggleUlt"])
		owner.ult_enabled = false;
	dsBuff[? "toggleRoc"] = owner.rockets_enabled;
	if (dsBuff[? "toggleRoc"])
		owner.rockets_enabled = false;
}

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff and damage player
	if (dsBuff[? "toggleUlt"])
		owner.ult_enabled = true;
	if (dsBuff[? "toggleRoc"])
		owner.rockets_enabled = true;
	scBuffRemove(owner, dsBuff);
} else {
	part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
		dsBuff[? BUFF_MAP.PARTICLE], irandom_range(2,4));
	dsBuff[? BUFF_MAP.CLOCK]++;
}