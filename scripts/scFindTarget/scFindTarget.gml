/// @desc find a target, return noone if none found
/// @arg team not to allow targetting to
function scFindTarget(argument0) {

	var team = argument0;
	//Find a target
	for (var i = instance_number(pShootable) - 1; i >= 0; i--) {
		var inst = instance_find(pShootable, i);
		if (inst.team != team && !scBuffFind(inst, BUFFTYPE.INVISIBLE))
			return inst;
	}

	return noone;



}
