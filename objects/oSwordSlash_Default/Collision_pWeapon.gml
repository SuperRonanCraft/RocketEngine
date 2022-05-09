/// @description  
if(!instance_exists(owner))
	exit;
if (!other.deactivate && other.owner != owner && timer > 0){ //Is not your rocket
	with (other) {
		if (target != noone)
			target = owner;
			
		other.oldOwner = owner;
		//other.oldOwner_time_dialation_adjust = owner.time_dialation;
		owner = other.owner; //Change the owner
		direction = direction + 180; //Flip the rocket
		image_angle = direction;
		if(variable_instance_exists(id, "hsp")){
			hsp *= -1;
		}
		if(variable_instance_exists(id, "vsp")){
			vsp *= -1;
		}
		
		part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_rectangle, ps_distr_gaussian);
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SPARKLE], 5);
		other.trueTimer = 4;
		
		weapon_map[?WEAPON_MAP.SPEED] += 0.5;
		dmg*=2;
		timer = 0;
		
		if(!variable_instance_exists(id,"reflectCount"))
			reflectCount = 0;
		reflectCount++;
		
	}
	
	if(variable_instance_exists(other.id,"reflectCount"))
		if(other.reflectCount >= 2)
			scAchievements_CustomEvent(ACHIEVEMENTS.REFLECTVOLLEY, true);
	
	var slash = instance_create_depth(other.x,other.y,depth,oUltimateSlashEffect);
	scPlaySound(SOUND.EFFECT_REFLECT);
	slash.owner = id;
	reflectHit++;
	
	if(reflectHit >= 2)
		scAchievements_CustomEvent(ACHIEVEMENTS.REFLECTTWICE, true);

}