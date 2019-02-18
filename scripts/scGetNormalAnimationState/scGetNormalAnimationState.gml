 ///The normal animation for an object

if (alive && hsp == 0 && vsp == 0 && standing)
	animState = ANIMATIONSTATE.STANDING;
else if (hsp == 0 && vsp == 0 && standing && !alive)
	animState = ANIMATIONSTATE.DEAD;
else if (controlling != 0 && standing && vsp == 0 && hsp != 0)
	animState = ANIMATIONSTATE.WALKING;	
else if (controlling == 0 && standing && vsp == 0 && hsp != 0)
	animState = ANIMATIONSTATE.SLIDING;	
else if (!standing && vsp > 0)
	animState = ANIMATIONSTATE.FALLING;
else if (!standing && vsp < 0)
	animState = ANIMATIONSTATE.RISING;