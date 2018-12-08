///@desc The "ReverseControls" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[? BUFF_MAP.CLOCK];

//When the buff firt starts, apply the buff
if (clock = 0) {
	//Switch controls
	owner.keydirection *= -1;
}

//If the internal clock reaches the time in seconds, expire
if (clock > dsBuff[? BUFF_MAP.TIME]) {
	owner.keydirection *= -1;
	scRemoveBuff(owner, dsBuff);
} else {
	part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
	dsBuff[? BUFF_MAP.PARTICLE], irandom_range(2,4));
	dsBuff[? BUFF_MAP.CLOCK]++;
}