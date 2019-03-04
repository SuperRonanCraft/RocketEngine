/// @desc Handles individual player buffs
/// @arg event type

var type = argument0;
var event = BUFF_MAP.STEP;

switch (type) {
	case BUFF_EVENT.DRAW:
		event = BUFF_MAP.DRAW;
		break;
	case BUFF_EVENT.DRAW_GUI_BELOW:
		event = BUFF_MAP.DRAW_GUI_BELOW;
		break;
	case BUFF_EVENT.DRAW_GUI_ABOVE:
		event = BUFF_MAP.DRAW_GUI_ABOVE;
		break;
	default:
		event = BUFF_MAP.STEP;
		break;
}
//Loop through all buffs
for (var b = 0; b < ds_list_size(buffs); b++) {
    var buf = buffs[| b];
	//Apply the script contained within the buff DS Map
	if (buf[? event] != noone)
		script_execute(buf[? event], id, buf);
}

enum BUFF_EVENT {
	STEP, DRAW, DRAW_GUI_BELOW, DRAW_GUI_ABOVE
}