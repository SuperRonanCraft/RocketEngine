///@desc Look for a buff in the target list and return true if found
///@arg ownerBuffs Target object's buff list
///@arg targetBuff The DS Map buff to look for by name

//Initialize variables
var targetBuffs = argument0;
var buff = argument1;

//Loop through each buff until type is found
for (var i = 0; i < ds_list_size(targetBuffs); i++) {
    var currentBuff = targetBuffs[| i];
	//If the types are equal
	if(currentBuff[? "type"] == buff)
		return true;	
}

//buff was not found
return false