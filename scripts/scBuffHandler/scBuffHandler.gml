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
	case BUFF_EVENT.DAMAGE_PREAPPLY:
		event = BUFF_MAP.DAMAGE_PREAPPLY; //[damager, damage]
		break;
	default:
		event = BUFF_MAP.STEP;
		break;
}
//Loop through all buffs
var extras = argument_count > 1 ? argument[1] : noone;
for (var b = 0; b < ds_list_size(buffs_map); b++) {
    var buff = buffs_map[| b];
	
	//Apply the script contained within the buff DS Map
	var stack_info = buff[? BUFF_MAP.STACK_INFO]
	if (stack_info[0] == BUFF_STACK_TYPE.COMBO && stack_info[2] < stack_info[1]) {
		//BUFF is a COMBO type and not given yet
		if (event == BUFF_MAP.STEP) { //Progress Timer on step event only
			//Apply the script contained within the buff DS Map
			stack_info[4]++;
			buff[? BUFF_MAP.STACK_INFO] = stack_info;
			if (stack_info[4] >= stack_info[3])
				scBuffRemove(id, buff);
		}
		continue;
	}
	if (buff[? event] != noone)
		if (event == BUFF_MAP.DAMAGE_PREAPPLY)
			return script_execute(buff[? event], id, buff, extras);
		else
		script_execute(buff[? event], id, buff, extras);
}

enum BUFF_EVENT {
	STEP, DRAW, DRAW_GUI_BELOW, DRAW_GUI_ABOVE, DAMAGE_APPLIED, DAMAGE_TAKEN, DAMAGE_PREAPPLY
}