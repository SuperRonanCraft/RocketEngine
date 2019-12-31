 ///The normal animation for an object
var map = player_map;
var animState = map[? PLAYER_MAP.ANIMATION_STATE];

var g_map = gravity_map;
//STANDING
if (map[? PLAYER_MAP.ALIVE] && g_map[? GRAVITY_MAP.HSP] == 0 && g_map[? GRAVITY_MAP.VSP] == 0 && g_map[? GRAVITY_MAP.STANDING])
	animState = ANIMATIONSTATE.STANDING;

//DEAD
else if (!map[? PLAYER_MAP.ALIVE])
	animState = scDeathAnimations();

//WALK CYCLE
else if (map[? PLAYER_MAP.ALIVE] && controlling != 0 && g_map[? GRAVITY_MAP.STANDING] && g_map[? GRAVITY_MAP.VSP] == 0 && g_map[? GRAVITY_MAP.HSP] != 0)
	animState = ANIMATIONSTATE.WALKING;	

//WALK END
else if (map[? PLAYER_MAP.ALIVE] && controlling == 0 && g_map[? GRAVITY_MAP.STANDING] && g_map[? GRAVITY_MAP.VSP] == 0 && g_map[? GRAVITY_MAP.HSP] != 0)
	animState = ANIMATIONSTATE.SLIDING;	

//FALLING
else if (!g_map[? GRAVITY_MAP.STANDING] && g_map[? GRAVITY_MAP.VSP] > 0)
	animState = ANIMATIONSTATE.FALLING;

//RISING
else if (!g_map[? GRAVITY_MAP.STANDING] && g_map[? GRAVITY_MAP.VSP] < 0)
	animState = ANIMATIONSTATE.RISING;
	
map[? PLAYER_MAP.ANIMATION_STATE] = animState;