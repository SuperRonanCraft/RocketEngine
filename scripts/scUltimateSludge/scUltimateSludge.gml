/// @arg ult map

var map = argument0;
var dir = team == TEAM.LEFT ? 1 : -1;
var amt = map[? "amount"];
for (var i = 0; i < amt; i++)
	with (instance_create_depth(x + (10 * dir), y, depth + 1, oUltimateSludge)) {
		owner = other;
		sludge_hsp = (sludge_hsp * dir) - (i - (amt / 2));
		sludge_vsp = sludge_vsp - ((i - (amt / 2)) / 4);
	}
