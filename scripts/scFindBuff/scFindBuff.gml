///@desc Look for a buff in the target list and return true if found
///@arg target the targets instance
///@arg bufftype the buff enum type

//Initialize variables
var targ = argument0;
var buff = argument1;

//Loop through each buff until type is found
for (var i = 0; i < ds_list_size(targ.buffs); i++) {
    var currentBuff = targ.buffs[| i];
	//If the types are equal
	if (currentBuff[? "type"] == buff)
		return true;	
}

//buff was not found
return false;