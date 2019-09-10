/// @description  

var isPlayer = other.object_index == oPlayer;

if(owner != noone && isPlayer && timer > 0){
	if(owner != other.id){
		if (ds_list_find_index(confirmList, other) == -1) { //We've never hit this player before
			ds_list_add(confirmList, other);
			ds_list_add(hitList, other);
			var dmg = 3;
			scDamageShootable(owner, other, false, true, dmg);
			scKnockbackGive(other,17* other.knockback_multiplier, image_xscale);
			part_particles_create(global.ParticleSystem1,other.x,other.y,oParticleHandler.ds_part[? PARTICLES.KBHIT],1);
		}
	}
}