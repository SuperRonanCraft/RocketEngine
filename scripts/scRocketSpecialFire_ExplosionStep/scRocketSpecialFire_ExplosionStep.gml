///@desc Explosion step script

//Find a pShootable to hit
hit = instance_place(x,y,pShootable)
var size = image_xscale;

//We will be using DS Lists for collision. Please read below
//for reasons why.

if(size > 0){
	//Only apply this once
	if(hit != noone && (hit != parent && !friendlyFire)){
	
		//Look for the shootable in our hitList
		if(ds_list_find_index(hitList,hit) == -1){
		
			//If they aren't there, add them to it
			ds_list_add(hitList,hit);
		}
	}

	//Go through the list and apply debuffs
	for (var c = 0; c < ds_list_size(hitList); c++) {
		
		//Confirm this only applies once to the object
	    if(ds_list_find_index(confirmList,hitList[|c]) == -1 && hitList[|c] != parent || friendlyFire){
			
			hurtPlayer(parent, hitList[|c]);
			
			
			
			ds_list_add(confirmList, hitList[|c]);
			
		}
	}


	//Make the flames look cool by individually spawning them on different frames!
	part_emitter_region(global.ParticleSystem1,global.Emitter1,x-(size*30),x+(size*30),y- (size*10),y+(size*10),ps_shape_ellipse,ps_distr_gaussian);

	if(image_index % 2 == 0){
		part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.partFire1,15*size);
	}
	else if(image_index % 3 == 0){
		part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.partFire2,14*size);
	}

	else{
		part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.partFire2,13*size);
	}
	
	
	//Destroy the explosion once the animation ends
	if(image_index > image_number-1){
		instance_destroy();	
	}
}
else{
	instance_destroy();	
}