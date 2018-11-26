///The normal animation for an object

if(hsp == 0 && vsp == 0 && standing){
	animState = ANIMATIONSTATE.STANDING;
}
else if(standing && vsp == 0 && hsp != 0){
	animState = ANIMATIONSTATE.WALKING;	
}
else if(!standing && vsp > 0){
	animState = ANIMATIONSTATE.FALLING;	
}
else if(!standing && vsp < 0){
	animState = ANIMATIONSTATE.RISING;	
}