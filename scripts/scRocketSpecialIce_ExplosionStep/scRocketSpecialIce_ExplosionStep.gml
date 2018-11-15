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
	    if(ds_list_find_index(confirmList,hitList[|c]) == -1 && hitList[|c] != parent || friendlyFire){
		
			//Only apply the debuff for 1.5 seconds to punish sloppy aim
			addBuff(hitList[|c],"Chilled",1.5,false,0);
			
			ds_list_add(confirmList,hitList[|c]);
		}
	}

	//Destroy the explosion once the animation ends
	if(image_index > image_number-1){
		instance_destroy();	
	}
}
else{
	instance_destroy();	
}
//Why DS Lists for collision?:
/*
Using a DS List to store all the collisions lets us bypass the preset of only checking "one" collision at
a time. If we were to keep a simple version as we have in previous code, only one player could be affected by
the explosion, EVEN if we were targeting the other one! This code ensures, along with oPlayer's new oExplosion
collision event, that all collisions are taken into account. If you're unsure about what to copy over when making
your own explosion scripts, just keep everything but the buff applied and the damage done (not seen in this script)
*/