/// @desc 
if (!standing) exit;

for (var i = 0; i < ds_list_size(jump_list); i++) {
	var inst = jump_list[| i];
	if (inst.id == other.id)
		exit;
}

with (other) {
	scPlaySound(SOUND.ULT_JUMPPAD_BOUNCE);
	vsp_real = -32;
}
ds_list_add(jump_list, other.id); //Dont allow the jump till we are off this list

//Achievement
//if (scBuffFind(other, BUFFTYPE.SLIME))
	//scAchievements_CustomEvent(ACHIEVEMENTS.SPRING_SLIME, true);