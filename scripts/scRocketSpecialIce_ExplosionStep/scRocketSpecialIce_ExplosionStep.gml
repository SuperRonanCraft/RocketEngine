///@desc Explosion step script

//Find a pShootable to hit
hit = instance_place(x,y,pShootable)


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
    if(hitList[|c] != parent || friendlyFire){
		addBuff(hitList[|c],"Chilled",1.5,false,0);
	}
}

if(image_index > image_number-1){
	instance_destroy();	
}
