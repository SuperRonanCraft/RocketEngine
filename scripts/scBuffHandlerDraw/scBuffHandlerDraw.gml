//@desc Handles individual player buffs with draw events

//Loop through all buffs
for (var b = 0; b < ds_list_size(buffs); b++) {
    var buf = buffs[| b];
	//Apply the script contained within the buff DS Map
	if (buf[? BUFF_MAP.DRAW] != noone)
		script_execute(buf[? BUFF_MAP.DRAW], id, buf);
}