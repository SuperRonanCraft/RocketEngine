/// @description  

if(instance_exists(owner)){
	if(!owner.player_map[?PLAYER_MAP.ALIVE])	{
		instance_destroy();	
		exit;
	}
}

else{
	instance_destroy();	
	exit;
}


if(floor(image_index) == 4){
	bite = true;
}
else{
	bite = false;	
}

if(image_index >= image_number-1){
	instance_destroy();	
	exit;
}

if(bite){

	collision_rectangle_list(bbox_left,bbox_top,bbox_right,bbox_bottom,pEntity,false,true,hitList,false);
	
	
}

if(!ds_list_empty(hitList)){
	
	for (var i = 0; i < ds_list_size(hitList); i++) {
	    var entity = hitList[|i];
		
		if(entity.player_map[? PLAYER_MAP.ALIVE] && entity.team != owner.team && entity.id != id){
			if(ds_list_find_index(confirmList,entity) == -1){
				ds_list_add(confirmList,entity);
				scShootableDamage(owner.id,entity.id,false,false,5, noone, DAMAGE_TYPE.STAB,false,DAMAGE_ELEMENT.INFECTED);
			}
		}
		
	}
	ds_list_clear(hitList);
	
}

if(!ds_list_empty(confirmList)){
	/*
	for (var c = 0; c < ds_list_size(confirmList); c++) {
	    var confirmHit = confirmList[|c];
		//scShootableDamage(owner.id,confirmHit.id,false,SOUND.EFFECT_BITE_HIT,5);
	}
	*/
	//ds_list_clear(confirmList);
	
}
