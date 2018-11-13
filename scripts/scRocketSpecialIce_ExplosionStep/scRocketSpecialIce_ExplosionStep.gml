///@desc Explosion step script

//Find a pShootable to hit
hit = instance_place(x,y,pShootable)


//Only apply this once
if(hit != noone && hit != parent){
	
	//Look for the shootable in our hitList
	if(ds_list_find_index(hitList,hit) == -1){
		
		//If they aren't there, add them to it and debuff them
		ds_list_add(hitList,hit);
		addBuff(hit,"Chilled",1.5,false,0);
	}
}

if(image_index > image_number-1){
	instance_destroy();	
}
