///@desc The "Slime" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[? "clock"];

if (clock = 0){	
	dsBuff[? "jump"] = owner.jump_height * 0.25;
	owner.jump_adj -= dsBuff[? "jump"];
}

//If the internal clock reaches the time in seconds, expire
if (clock > dsBuff[? "time"]) {
	owner.jump_adj += dsBuff[? "jump"];	
	//Remove Slime
	scRemoveBuff(owner, dsBuff);
} else {
	//Otherwise, the buff is still active, and create a visual indicator
	if (clock % 2 == 0)
		part_particles_create(global.ParticleSystem1, owner.x + irandom_range(-15,15), owner.y, dsBuff[? "particle"], 5);
	//Also, increase the clock. Essential for every buff.
	dsBuff[? "clock"]++;
}