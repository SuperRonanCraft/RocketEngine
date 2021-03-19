/// @desc 
if (!standing) exit;

for (var i = 0; i < ds_list_size(jump_list); i++) {
	var inst = jump_list[| i];
	if (inst.id == other.id)
		exit;
}

with (other) {
	if (vsp_move >= 0) {
		other.jump_ani = other.jump_ani_max; //Animate the jump pad
		vsp_move = other.jump_pwr - vsp_move;
	}
	scPlaySound(SOUND.ULT_JUMPPAD_BOUNCE);
	vsp_move = max(vsp_move, -32); //Maximum jump
}
ds_list_add(jump_list, other.id); //Dont allow the jump till we are off this list

//Achievement
//if (scBuffFind(other, BUFFTYPE.SLIME))
	//scAchievements_CustomEvent(ACHIEVEMENTS.SPRING_SLIME, true);