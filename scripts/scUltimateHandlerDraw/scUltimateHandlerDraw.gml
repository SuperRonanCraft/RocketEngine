if (!ult_enabled || !canControl || !global.play) exit; //Is the system even enabled?

if (ult_casting) {
	//Ultimate casting bar above players heads
	var yy = bbox_top - 4, yy2 = bbox_top - 8;
	var percent = (ult_cast_time_max - ult_cast_time) / ult_cast_time_max;
	scDrawRect(x - 51, yy + 1, x + 51, yy2 + 1, c_black, false, 0.9);
	scDrawRect(x - 50, yy, x - 50 + (percent * 100), yy2, c_yellow, false, 0.9);
	//Casting script
	if (!ds_map_empty(ult_casting_map))
		if (ult_casting_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] != noone)
			script_execute(ult_casting_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW], !shoot_face ? (team == TEAM.LEFT ? 0 : 180) : (facing == 1 ? 0 : 180));
}

//Ultimate ready indicator
if (ult_charge == ult_charge_max && hp > 0) {
	//scDrawCircle(x + 25, bbox_top, 5, c_green, false, scMovementWave(0.3, 0.8, 1));
	var dir = irandom(360);
	var dis = irandom_range(20, 30);
	scDrawLightning(x, y, x + lengthdir_x(dis, dir), y + lengthdir_y(dis, dir), irandom_range(2, 5), c_aqua);
}

//Casted script (one event)
if (ult_casted_draw != noone) {
	script_execute(ult_casted_draw);
	ult_casted_draw = noone;
}