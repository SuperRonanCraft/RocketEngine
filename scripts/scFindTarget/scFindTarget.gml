/// @desc find a target, return noone if none found
/// @arg team not to allow targetting to

var team = argument0;
//Find a target
for (var i = instance_number(pShootable) - 1; i >= 0; i--) {
	var inst = instance_find(pShootable, i);
	if (inst.team != team)
		return inst;
}

return noone;
