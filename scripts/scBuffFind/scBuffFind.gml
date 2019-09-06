///@desc Look for a buff in the target list and return true if found
///@arg target the targets instance
///@arg bufftype the buff enum type

//Initialize variables
var targ = argument0;
var buff = argument1;

//Loop through each buff until type is found
if (instance_exists(targ))
	for (var i = 0; i < ds_list_size(targ.buffs_map); i++) {
	    var currentBuff = targ.buffs_map[| i];
		//If the types are equal
		if (currentBuff[? BUFF_MAP.TYPE] == buff)
			return true;	
	}

//buff was not found
return false;