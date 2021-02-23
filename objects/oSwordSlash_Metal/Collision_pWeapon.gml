/// @description  
if (!other.deactivate && other.owner != owner){ //Is not your rocket
	with (other) {
		part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_rectangle, ps_distr_gaussian);
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.METAL], 25);
		instance_destroy();
	}
	var slash = instance_create_depth(other.x,other.y,depth,oUltimateSlashEffect);
	slash.image_blend = c_red;
	scPlaySound(SOUND.EFFECT_HIT);
	slash.owner = id;
}