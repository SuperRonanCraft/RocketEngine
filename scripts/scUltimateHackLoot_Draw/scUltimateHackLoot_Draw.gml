var side = argument[0] == 0 ? 1 : -1;

var amt = instance_number(pPickup);
var hackable = 0;
for (var i = 0; i < amt; i++) {
	var inst = instance_find(pPickup, i);
	if (inst.team == id.team || inst.item == noone)
		continue;
	hackable++;
	scDrawLine(x, y, inst.x, inst.y, c_red, 4, 0.5);
}

if (hackable == 0) {
	scDrawText(x, bbox_top - 10, "No Hackables!", 
		c_red, 0.5, noone, 0.8, fa_middle, fa_bottom);
	ult_cast_time = max(ult_cast_time, 1);
}