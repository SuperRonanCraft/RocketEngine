/// @desc find the last checkpoint triggered
/// @arg checkpoint-order-id
function scCheckpointGet(argument0) {

	var insts = instance_number(oCheckpoint);
	var check_finding = argument0;
	var check_found = noone;
	for (var i = 0; i < insts; i++) {
		var inst = instance_find(oCheckpoint, i);
		if (inst.order_id == check_finding) {
			check_found = inst; break;}
	}
	return check_found;


}
