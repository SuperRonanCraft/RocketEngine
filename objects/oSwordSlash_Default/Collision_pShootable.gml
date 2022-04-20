/// @description  

if(!instance_exists(owner))
	exit;

var isPlayer = scGetParent(pEntity, other);
ds_list_add(hitList, other);
if(!schwing && owner != noone && isPlayer && timer > 0){
	if(owner != other.id){
		if (ds_list_find_index(confirmList, other) == -1) { //We've never hit this player before
			ds_list_add(confirmList, other);
			var dmg = 25;
			scShootableDamage(owner, other, false, true, dmg);
			part_particles_create(global.ParticleSystem1,other.x,other.y,oParticleHandler.ds_part[? PARTICLES.KBHIT],1);
		
			oldOwner = other;
			//oldOwner_time_dialation_adjust = other.time_dialation;
		
			trueTimer = 4;
			scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
			
			if(scBuffFind(owner, BUFFTYPE.INVISIBLE))
				scAchievements_CustomEvent(ACHIEVEMENTS.INVISISLASH, true);
		}
	}
}