///@desc The "Burn Rush" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[? "clock"];

//When the buff firt starts, apply the slow
if(clock = 0){	
	dsBuff[? "overallSpeed"] = 0;
	clock++;
}

//If the internal clock reaches the time in seconds, expire
//Or if you are chilled
if(/*scFindBuff(owner.buffs, "Chilled") ||*/ clock > dsBuff[? "time"]){
	//Return to normal speed
	owner.move_adj -= dsBuff[? "overallSpeed"];	
	//Remove Burn Rush
	scRemoveBuff(owner.buffs, dsBuff);
}
else{
	//Create a new item in the DS Map so that it isn't saved to the object
	dsBuff[? "speedup"] = owner.walksp* (1 - ( (clock)/(dsBuff[? "time"])));
	owner.move_adj -= dsBuff[? "overallSpeed"];
	owner.move_adj += dsBuff[? "speedup"];
	dsBuff[? "overallSpeed"] = dsBuff[? "speedup"];
	
	
	//Otherwise, the buff is still active, and create a visual indicator
	part_particles_create(global.ParticleSystem1,x + irandom_range(-10,10), y + irandom_range(-15,15) , dsBuff[? "particle"],(abs( (clock - dsBuff[? "time"]) ) + 1) );
	//Also, increaase the clock. Essential for every buff.
	dsBuff[? "clock"]++;
}