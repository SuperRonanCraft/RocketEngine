///@desc The "Speed" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[? BUFF_MAP.CLOCK];

//When the buff firt starts, apply the buff
if (clock = 0) {
	//Save original gravity
	dsBuff[? "grvOriginal"] = owner.grv;
	//Generate the lowest gravity
	dsBuff[? "grv"] = 1;
	clock++;
}

//If the internal clock reaches the time in seconds, expire
if (clock > dsBuff[? BUFF_MAP.TIME]) {
	owner.grv = dsBuff[? "grvOriginal"];
	scRemoveBuff(owner, dsBuff);
} else {
	//Lower gravity slowly
	owner.grv = max(owner.grv - 0.05, dsBuff[? "grv"]);
	part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
	dsBuff[? BUFF_MAP.PARTICLE], 10);
	dsBuff[? BUFF_MAP.CLOCK]++;
}