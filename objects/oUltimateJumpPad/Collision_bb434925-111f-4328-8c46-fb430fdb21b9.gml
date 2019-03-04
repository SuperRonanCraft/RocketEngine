/// @desc 
if (!standing) exit;

for (var i = 0; i < ds_list_size(jump_list); i++) {
	var inst = jump_list[| i];
	if (inst.id == id)
		exit;
}

with (other) {
	vsp_move = other.jump_pwr - vsp_move;
	vsp_move = max(vsp_move, -30);
}
ds_list_add(jump_list, id);