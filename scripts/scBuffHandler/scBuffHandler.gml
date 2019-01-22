//@desc Handles individual player buffs

//Loop through all buffs
for (var b = 0; b < ds_list_size(buffs); b++) {
    var buf = buffs[| b];
	//Apply the script contained within the buff DS Map
	script_execute(buf[? BUFF_MAP.STEP], id, buf);
}