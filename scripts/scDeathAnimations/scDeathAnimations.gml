///Special death animations

var animState = playerMap[?PLAYER_MAP.ANIMATION_STATE];

switch(causeOfDeath){
	
	case DEATH_LIST.FROZEN:
		if(!animationDebounce){
			player_knockback = false;
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
			player_knockback = false;

			animState = ANIMATIONSTATE.DEADLASER;
		}
		part_emitter_region(global.ParticleSystem1, global.Emitter1,x- 10,x+10,y-10,y+10, ps_shape_ellipse, ps_distr_gaussian)
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.ASH],2);
		
		break;
			
			
	case noone:
	default:
	
		if(animState != ANIMATIONSTATE.DEAD && animState != ANIMATIONSTATE.DEAD2 && standing){
			if(sign(hsp) == facing)
				animState = ANIMATIONSTATE.DEAD2;
			else if(sign(hsp) != facing)
				animState = ANIMATIONSTATE.DEAD;
			else{
				
				if (irandom_range(0, 1))
					animState = ANIMATIONSTATE.DEAD2;	
				else
					animState = ANIMATIONSTATE.DEAD;	
			}
		
		}
		else if(!standing){
			animState = ANIMATIONSTATE.FALLING;	
		}
		break;
	
}
	
return animState;