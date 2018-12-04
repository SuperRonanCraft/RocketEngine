///@desc The "Speed" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock = 0) {	
	dsBuff[? "overallSpeed"] = 0;
	clock++;
}

//If the internal clock reaches the time in seconds, expire
if (clock > dsBuff[? BUFF_MAP.TIME]) {
	//Return to normal speed
	owner.move_adj -= dsBuff[? "overallSpeed"];
	scRemoveBuff(owner, dsBuff);
} else {
	//Create a new item in the DS Map so that it isn't saved to the object
	dsBuff[? "speedup"] = owner.walksp * 1.5;
	owner.move_adj -= dsBuff[? "overallSpeed"];
	owner.move_adj += dsBuff[? "speedup"];
	dsBuff[? "overallSpeed"] = dsBuff[? "speedup"];
	//Otherwise, the buff is still active, and create a visual indicator
	part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
	dsBuff[? BUFF_MAP.PARTICLE], (abs(clock - dsBuff[? BUFF_MAP.TIME]) + 1));
	dsBuff[? BUFF_MAP.CLOCK]++;
}