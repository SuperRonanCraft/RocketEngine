///@desc The "LowGravity" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[? BUFF_MAP.CLOCK];

//When the buff firt starts, apply the buff
if (clock = 0) {
	//Save original gravity
	dsBuff[? "grvOriginal"] = owner.gravity_map[? GRAVITY_MAP.GRAVITY];
	//Generate the lowest gravity
	dsBuff[? "grv"] = owner.gravity_map[? GRAVITY_MAP.GRAVITY] / 2;
}

//If the internal clock reaches the time in seconds, expire
if (clock > dsBuff[? BUFF_MAP.TIME]) {
	owner.gravity_map[? GRAVITY_MAP.GRAVITY] = dsBuff[? "grvOriginal"];
	scBuffRemove(owner, dsBuff);
} else {
	//Lower gravity slowly
	owner.gravity_map[? GRAVITY_MAP.GRAVITY] = max(owner.gravity_map[? GRAVITY_MAP.GRAVITY] - 0.05, dsBuff[? "grv"]);
	part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
		dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
	dsBuff[? BUFF_MAP.CLOCK]++;
}