/// @description  

var isPlayer = other.object_index == oPlayer;
ds_list_add(hitList, other);
if(!schwing && owner != noone && isPlayer){
	if(owner != other.id){
		if (ds_list_find_index(confirmList, other) == -1) { //We've never hit this player before
			ds_list_add(confirmList, other);
			var dmg = image_index > image_number / 2 ? 1 : 3;
			scShootableDamage(owner, other, false, true, dmg);
			part_particles_create(global.ParticleSystem1,other.x,other.y,oParticleHandler.ds_part[? PARTICLES.KBHIT],1);
			scBuffAdd(BUFFTYPE.BLEEDOUT, other, owner);
			oldOwner = other;
			//oldOwner_time_dialation_adjust = other.time_dialation;
			other.vsp_move -= 8;
			other.hsp_move += 30 * image_xscale;
			trueTimer = 4;
			scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
		}
	}
}