///@desc Look for a buff in the target list and return true if found
///@arg ownerBuffs Target object's buff list
///@arg targetBuff The DS Map buff to look for, by name

//Initialize variables
var ownerBuffs = argument0;
var targetBuff = argument1;

//Current buff we're looking at
var currentBuff = noone;

//Loop through each buff until name is found
for (var b = 0; b < ds_list_size(ownerBuffs); b++) {
    currentBuff = ownerBuffs[| b];
	
	//If the names are equal
	if(currentBuff[? "name"] == targetBuff[? "name"]){
		//end loop and script
		return true;	
	}
}

//buff was not found
return false