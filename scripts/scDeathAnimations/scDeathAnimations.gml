///Special death animations

var animState = player_map[?PLAYER_MAP.ANIMATION_STATE];

switch (causeOfDeath) {
	
	case DEATH_LIST.EXPLOSION:
		//gravity_map[? GRAVITY_MAP.GRAVITY_ENABLED] = false;
		image_alpha = 0;
		part_emitter_region(global.ParticleSystem1, global.Emitter1,x- 10,x+10,y-10,y+10, ps_shape_ellipse, ps_distr_gaussian)
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.EXPLOSION_DEFAULT],3);
		
		break;
	
	case DEATH_LIST.FROZEN:
		if(!animationDebounce){
			gravity_map[? GRAVITY_MAP.KNOCKBACK_ENABLED] = false;
			animationDebounce = true;
			animState = ANIMATIONSTATE.DEADFROZEN;
			friction_adj -= 0.15;
		}

		part_emitter_region(global.ParticleSystem1, global.Emitter1,x- 10,x+10,y-10,y+10, ps_shape_ellipse, ps_distr_gaussian)
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SPARKLE],3);
		break;
	
	case DEATH_LIST.LASER:
		
		if(!animationDebounce){
			
			animationDebounce = true;
			gravity_map[? GRAVITY_MAP.KNOCKBACK_ENABLED] = false;

			animState = ANIMATIONSTATE.DEADLASER;
		}
		part_emitter_region(global.ParticleSystem1, global.Emitter1,x- 10,x+10,y-10,y+10, ps_shape_ellipse, ps_distr_gaussian)
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.ASH],2);
		break;	
		
	case noone:
	default:
		if(animState != ANIMATIONSTATE.DEAD && animState != ANIMATIONSTATE.DEAD2 && gravity_map[? GRAVITY_MAP.STANDING]){
			if(sign(gravity_map[? GRAVITY_MAP.HSP]) == facing)
				animState = ANIMATIONSTATE.DEAD2;
			else if(sign(gravity_map[? GRAVITY_MAP.HSP]) != facing)
				animState = ANIMATIONSTATE.DEAD;
			
			else{
				
				if (irandom_range(0, 1))
					animState = ANIMATIONSTATE.DEAD2;	
				else
					animState = ANIMATIONSTATE.DEAD;	
			}
		}
		else if(!gravity_map[? GRAVITY_MAP.STANDING])
			animState = ANIMATIONSTATE.FALLING;	
		break;
}
	
return animState;