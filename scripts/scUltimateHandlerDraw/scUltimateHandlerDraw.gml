var map = ultimate_map;

if (!map[? ULTIMATE_CASTING_MAP.ENABLED] || !playerMap[? PLAYER_MAP.CAN_CONTROL] || !global.play) exit; //Is the system even enabled?

var showultbar = false;
if (map[? ULTIMATE_CASTING_MAP.CASTING]) {
	//Ultimate casting bar above players heads
	showultbar = true;
	//Casting script
	if (!ds_map_empty(map[? ULTIMATE_CASTING_MAP.CASTING_MAP])) {
		var ult_map = map[? ULTIMATE_CASTING_MAP.CASTING_MAP]
		if (ult_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] != noone)
			script_execute(ult_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW], !shoot_face ? (team == TEAM.LEFT ? 0 : 180) : (facing == 1 ? 0 : 180), ult_map);
	}
} else if (map[? ULTIMATE_CASTING_MAP.CAST_TIME] != map[? ULTIMATE_CASTING_MAP.CAST_TIME_MAX])
	showultbar = true;

if (showultbar && global.weapon_info) {
	var len = 100, width = 3, margin = 2;
	var yy = bbox_top - (width + margin), xx = x - (len / 2);
	var percent = (map[? ULTIMATE_CASTING_MAP.CAST_TIME_MAX] - map[? ULTIMATE_CASTING_MAP.CAST_TIME]) / map[? ULTIMATE_CASTING_MAP.CAST_TIME_MAX];
	scDrawLine(xx - (margin / 2), yy, xx + len + (margin / 2), yy, c_gray, width + margin, 0.5);
	scDrawLine(xx, yy, xx + (percent * len), yy, c_yellow, width, 0.5);
}

//Ultimate ready indicator
if (map[? ULTIMATE_CASTING_MAP.CHARGE] == map[? ULTIMATE_CASTING_MAP.CHARGE_MAX] && hp > 0) {
	//scDrawCircle(x + 25, bbox_top, 5, c_green, false, scMovementWave(0.3, 0.8, 1));
	var dir = irandom(360);
	var dis = irandom_range(20, 30);
	scDrawLightning(x, y, x + lengthdir_x(dis, dir), y + lengthdir_y(dis, dir), irandom_range(2, 5), c_aqua);
}

//Casted script (one event)
if (map[? ULTIMATE_CASTING_MAP.CASTED_DRAW] != noone) {
	script_execute(map[? ULTIMATE_CASTING_MAP.CASTED_DRAW]);
	map[? ULTIMATE_CASTING_MAP.CASTED_DRAW] = noone;
}