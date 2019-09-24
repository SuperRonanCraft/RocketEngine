/// @description  

var isPlayer = other.object_index == oPlayer;
//collision_rectangle_list(bbox_left,bbox_top,bbox_right,bbox_bottom,pShootable,false,true,hitList,true);
ds_list_add(hitList, other);
if(!schwing && owner != noone && isPlayer && timer > 0){
	if(owner != other.id){
		if (ds_list_find_index(confirmList, other) == -1) { //We've never hit this player before
			ds_list_add(confirmList, other);
			var dmg = 3;
			scShootableDamage(owner, other, false, true, dmg);
			part_particles_create(global.ParticleSystem1,other.x,other.y,oParticleHandler.ds_part[? PARTICLES.TECH],1);
			scBuffAdd(BUFFTYPE.BURNRUSH, other, owner);
			oldOwner = other;
			//oldOwner_time_dialation_adjust = other.time_dialation;
			other.vsp_move -= 15;
			other.hsp_move += 10 * owner.facing;
			trueTimer = 4;
			scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
		}
	}
}