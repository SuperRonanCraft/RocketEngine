///@desc The "Chilled" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[?"clock"];

//When the buff firt starts, apply the slow
if(clock == 0){	
	//Create a new item in the DS Map so that it isn't saved to the object
	dsBuff[?"slow"] = owner.walksp/2;
	owner.move_adj -= dsBuff[?"slow"];
	//This way it does not get changed/affected in any other way
	
}

//If the internal clock reaches the time in seconds, expire
if(findBuff(owner.buffs,"Burn Rush") || clock > dsBuff[?"time"]){
	//Return to normal speed
	owner.move_adj += dsBuff[?"slow"];	
	
	//Remove Chilled
	removeBuff(owner.buffs, dsBuff);
}
else{
	//Otherwise, the buff is still active, and create a visual indicator
	if(clock%2 == 0){
		//One particle for each foot!
		part_particles_create(global.ParticleSystem1,owner.x - ((owner.x - owner.bbox_right)/2),owner.y + (owner.bbox_bottom - owner.y),oParticleHandler.partWinter,1);
		
		part_particles_create(global.ParticleSystem1,owner.x + ((owner.x - owner.bbox_right)/2),owner.y + (owner.bbox_bottom - owner.y),oParticleHandler.partWinter,1);
	}
	//Also, increaase the clock. Essential for every buff.
	dsBuff[?"clock"]++;
}