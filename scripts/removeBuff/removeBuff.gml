///@desc Strictly remove a buff from the list and destroy the DS Map. Returns false if not found.
///@arg ownerBuffs Target object's buff list
///@arg targetBuff The DS Map buff to delete, by name


//Initialize variables
var ownerBuffs = argument0;
var targetBuff = argument1;

//Current buff we're looking at
var currentBuff = noone;

//Loop through each buff until name is found
for (var b = 0; b < ds_list_size(ownerBuffs); b++) {
    currentBuff = ownerBuffs[| b];
	
	//If the buffs are the EXACT SAME
	if(currentBuff == targetBuff){
		//Delete from list
		ds_list_delete(ownerBuffs,b);
		//Destroy to free up memory
		ds_map_destroy(targetBuff);
		return true;	
	}
}

//buff was not found
return false