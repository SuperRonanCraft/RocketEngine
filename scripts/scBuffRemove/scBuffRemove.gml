///@desc Strictly remove a buff from the list and destroy the DS Map. Returns false if not found.
///Should only be called by a buff itself
///@arg target the targets instance
///@arg buff The DS Map buff to delete by type

//Initialize variables
var targ = argument0;
var buff = argument1;

//Loop through each buff until type is found
for (var b = 0; b < ds_list_size(targ.buffs_map); b++) {
    var currentBuff = targ.buffs_map[| b];
	
	//If the buffs are the EXACT SAME
	if (currentBuff == buff) {
		//Delete from list
		ds_list_delete(targ.buffs_map, b);
		//Destroy to free up memory
		ds_map_destroy(buff);
		return true;	
	}
}

//buff was not found
return false