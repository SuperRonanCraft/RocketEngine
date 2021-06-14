/// @desc

/*if (other.owner != owner){
	show_debug_message("exiting 1");
	exit; //Cannot amp enemy rockets
}*/
var buffed = false;
for (var i = 0; i < ds_list_size(rockets_amped); i++)
	if (rockets_amped[| i] == other.id) {
		buffed = true;
		//show_debug_message("exiting 2");
		break;
	}
if (!buffed) {
	ds_list_add(rockets_amped, other.id);
	part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left,bbox_right,bbox_top,bbox_bottom, ps_shape_rectangle, ps_distr_invgaussian);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[?PARTICLES.SHIELD_DAMAGE], 3);
	with (other) {
		dmg *= 2;
	}
	scPlaySound(SOUND.ULT_TELEPORT_USE);
}
