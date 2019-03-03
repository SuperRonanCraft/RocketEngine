 ///The normal animation for an object

if (alive && hsp == 0 && vsp == 0 && standing){
	animState = ANIMATIONSTATE.STANDING;
}
else if (standing && !alive && (animState != ANIMATIONSTATE.DEAD && animState != ANIMATIONSTATE.DEAD2)){
	
	if(sign(hsp) == facing)	{
		animState = ANIMATIONSTATE.DEAD2;
	}
	else if(sign(hsp) != facing){
		animState = ANIMATIONSTATE.DEAD;
	}
	else{
		if(irandom_range(0,1)){
			animState = ANIMATIONSTATE.DEAD2;	
		}
		else{
			animState = ANIMATIONSTATE.DEAD;	
		}
	}
	show_debug_message("someone died");
}
else if (alive && controlling != 0 && standing && vsp == 0 && hsp != 0)
	animState = ANIMATIONSTATE.WALKING;	
else if (alive && controlling == 0 && standing && vsp == 0 && hsp != 0)
	animState = ANIMATIONSTATE.SLIDING;	
else if (!standing && vsp > 0)
	animState = ANIMATIONSTATE.FALLING;
else if (!standing && vsp < 0)
	animState = ANIMATIONSTATE.RISING;