/// @desc Handles individual player events
/// @arg event type
/// @arg extra* arguments
function scPlayerHandler() {

	var type = argument[0];
	var event = PLAYER_MAP.STEP;

	switch (type) {
		default:
			event = PLAYER_MAP.STEP;
			break;
	}
	//Loop through all buffs
	var extras = argument_count > 1 ? argument[1] : noone;
	for (var b = 0; b < ds_list_size(buffs_map); b++) {
	    var buf = buffs_map[| b];
		//Apply the script contained within the buff DS Map
		if (buf[? event] != noone)
			script_execute(buf[? event], id, buf, extras);
	}

	enum PLAYER_EVENT {
		STEP
	}


}
