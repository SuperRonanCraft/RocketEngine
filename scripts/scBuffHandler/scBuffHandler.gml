/// @desc Handles individual player buffs
/// @arg event type
/// @arg extra* arguments

var type = argument[0];
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
	case BUFF_EVENT.DAMAGE_APPLIED:
		event = BUFF_MAP.DAMAGE_APPLIED; //[damaging, damage]
		break;
	case BUFF_EVENT.DAMAGE_TAKEN:
		event = BUFF_MAP.DAMAGE_TAKEN; //[damager, damage]
		break;
	default:
		event = BUFF_MAP.STEP;
		break;
}
//Loop through all buffs
var extras = argument_count > 1 ? argument[1] : noone;
for (var b = 0; b < ds_list_size(buffs); b++) {
    var buf = buffs[| b];
	//Apply the script contained within the buff DS Map
	if (buf[? event] != noone)
		script_execute(buf[? event], id, buf, extras);
}

enum BUFF_EVENT {
	STEP, DRAW, DRAW_GUI_BELOW, DRAW_GUI_ABOVE, DAMAGE_APPLIED, DAMAGE_TAKEN
}