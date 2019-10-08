 ///The normal animation for an object
var map = player_map;
var animState = map[? PLAYER_MAP.ANIMATION_STATE];

var g_map = gravity_map;
if (map[? PLAYER_MAP.ALIVE] && g_map[? GRAVITY_MAP.HSP] == 0 && g_map[? GRAVITY_MAP.VSP] == 0 && g_map[? GRAVITY_MAP.STANDING])
	animState = ANIMATIONSTATE.STANDING;
else if (!map[? PLAYER_MAP.ALIVE])
	animState = scDeathAnimations();
else if (map[? PLAYER_MAP.ALIVE] && controlling != 0 && g_map[? GRAVITY_MAP.STANDING] && g_map[? GRAVITY_MAP.VSP] == 0 && g_map[? GRAVITY_MAP.HSP] != 0)
	animState = ANIMATIONSTATE.WALKING;	
else if (map[? PLAYER_MAP.ALIVE] && controlling == 0 && g_map[? GRAVITY_MAP.STANDING] && g_map[? GRAVITY_MAP.VSP] == 0 && g_map[? GRAVITY_MAP.HSP] != 0)
	animState = ANIMATIONSTATE.SLIDING;	
else if (!g_map[? GRAVITY_MAP.STANDING] && g_map[? GRAVITY_MAP.VSP] > 0)
	animState = ANIMATIONSTATE.FALLING;
else if (!g_map[? GRAVITY_MAP.STANDING] && g_map[? GRAVITY_MAP.VSP] < 0)
	animState = ANIMATIONSTATE.RISING;
	
map[? PLAYER_MAP.ANIMATION_STATE] = animState;