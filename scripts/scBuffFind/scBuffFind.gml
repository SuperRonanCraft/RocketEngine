///@desc Look for a buff in the target list and return true if found
///@arg target the targets instance
///@arg bufftype the buff enum type
///@arg return-buff* return buff found
function scBuffFind() {

	//Initialize variables
	var targ = argument[0];
	var buff = argument[1];
	var return_buff = argument_count >= 3 ? argument[2] : false;

	//Loop through each buff until type is found
	if (instance_exists(targ))
		for (var i = 0; i < ds_list_size(targ.buffs_map); i++) {
		    var currentBuff = targ.buffs_map[| i];
			//If the types are equal
			if (currentBuff[? BUFF_MAP.TYPE] == buff)
				return return_buff ? currentBuff : true;	
		}

	//buff was not found
	return return_buff ? noone : false;


}
