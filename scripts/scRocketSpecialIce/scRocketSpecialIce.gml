///@desc Ice Rocket's particle effects & destroys rocket properly

//This script runs every step.
//Useful for particle effects and crucial for checking if the rocket is destroyed.


//Particle emitter first gets placed around the back of the rocket
var facing = 1;
if(direction > 90 && direction < 270){
	facing = -1;
}
part_emitter_region(global.ParticleSystem1,global.Emitter1,x- (facing*((x - bbox_left)-5)), x- (facing*5),y-5,y+5,ps_shape_ellipse,ps_distr_gaussian)

//Then bursts with the defined particle over at oParticleHandler
part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.partIce,4);

//This bit is useful for ensuring no crash occurs by instance destruction
if(destroy){
	
	//If the rocket needs to check an instance (like another rocket)
	//collideRocket is set to 1 to destroy AFTER the checks are done
	if(collideRocket > 0){
		collideRocket--;	
	}
	
	else{
		instance_destroy();	
	}
}