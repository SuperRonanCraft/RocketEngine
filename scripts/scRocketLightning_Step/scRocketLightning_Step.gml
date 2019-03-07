
var spd = rocket_map[? ROCKET_MAP.SPEED];
if (lightning[? "dis_travelled"] > lightning[? "dis_slowed"])
	spd = (lightning[? "dis_slowed"] / lightning[? "dis_travelled"]) * spd;

if (lightning[? "dis_travelled"] < lightning[? "dis_target"] && spd > 2) {
	scMovementLine(spd, direction);
	lightning[? "dis_travelled"] += spd * owner.time_dialation;;
} else
	event_user(0);