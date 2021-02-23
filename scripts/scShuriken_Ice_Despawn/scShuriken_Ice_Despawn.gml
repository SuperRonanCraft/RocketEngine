function scShuriken_Ice_Despawn() {


	if(!debounce){
	
		scPlaySound(SOUND.ULT_SHIELD_BREAK);

		part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_rectangle, ps_distr_gaussian);
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.ICE], 25);
		
	
		stuckTo = noone;
		deactivate = true;
	
		debounce = true;

		image_alpha = 0;
	
		if(ds_list_empty(confirmList)){
			event_user(1);	
		}
	
		event_user(0);
	
	
	
	}

	vsp += 5;


}
