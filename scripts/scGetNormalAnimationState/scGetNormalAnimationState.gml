 ///The normal animation for an object
var map = player_map;
var animState = map[? PLAYER_MAP.ANIMATION_STATE];

if (map[? PLAYER_MAP.ALIVE] && hsp == 0 && vsp == 0 && standing)
	animState = ANIMATIONSTATE.STANDING;
else if (!map[? PLAYER_MAP.ALIVE])
	animState = scDeathAnimations();
else if (map[? PLAYER_MAP.ALIVE] && controlling != 0 && standing && vsp == 0 && hsp != 0)
	animState = ANIMATIONSTATE.WALKING;	
else if (map[? PLAYER_MAP.ALIVE] && controlling == 0 && standing && vsp == 0 && hsp != 0)
	animState = ANIMATIONSTATE.SLIDING;	
else if (!standing && vsp > 0)
	animState = ANIMATIONSTATE.FALLING;
else if (!standing && vsp < 0)
	animState = ANIMATIONSTATE.RISING;
	
map[? PLAYER_MAP.ANIMATION_STATE] = animState;