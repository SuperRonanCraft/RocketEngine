//@desc Handles individual player buffs

//Initialize buff we're looking at
var currentBuff = noone;

//Loop through all buffs
for (var b = 0; b < ds_list_size(buffs); b++) {
    currentBuff = buffs[| b];
	
	//Apply the script contained within the buff DS Map
	script_execute(currentBuff[?"stepScript"], id, currentBuff);
}

//This script is run every step of oPlayer. It executes buffs and their scripts.
