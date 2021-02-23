/// @description  

var isPlayer = other.object_index == oPlayer;
ds_list_add(hitList, other);
if(!schwing && owner != noone && isPlayer && timer > 0){
	if(owner != other.id){
		if (ds_list_find_index(confirmList, other) == -1) { //We've never hit this player before
			ds_list_add(confirmList, other);
			var dmg = 3;
			scShootableDamage(owner, other, false, true, dmg);
			scShootableKnockback(other,17* other.knockback_multiplier, image_xscale);
			part_particles_create(global.ParticleSystem1,other.x,other.y,oParticleHandler.ds_part[? PARTICLES.KBHIT],1);
			
			part_emitter_region(global.ParticleSystem1, global.Emitter1, x, x, y, y, ps_shape_rectangle, ps_distr_gaussian);
			part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SLIME_PAINT], 25);
			
			scBuffAdd(BUFFTYPE.SLIME, other, owner);
			
			scSpawnParticle(x, y, 3, 5, spSlime,WORLDPART_TYPE.SLIME);
			
			oldOwner = other;
			//oldOwner_time_dialation_adjust = other.time_dialation;
		
			trueTimer = 4;
			scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
		}
	}
}