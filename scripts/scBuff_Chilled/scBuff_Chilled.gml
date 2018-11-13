///@desc The "Chilled" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[?"clock"];

if(clock == 0){
	owner.walksp /= 2;	
}

if(clock > dsBuff[?"time"]*game_get_speed(gamespeed_fps)){
	owner.walksp = 6;	
	removeBuff(owner.buffs, dsBuff);
}
else{
	if(clock%2 == 0)
		//one particle for each foot!
		part_particles_create(global.ParticleSystem1,owner.x - ((owner.x - owner.bbox_right)/2),owner.y + (owner.bbox_bottom - owner.y),oParticleHandler.partWinter,1);
		
		part_particles_create(global.ParticleSystem1,owner.x + ((owner.x - owner.bbox_right)/2),owner.y + (owner.bbox_bottom - owner.y),oParticleHandler.partWinter,1);
	
	dsBuff[?"clock"]++;
}