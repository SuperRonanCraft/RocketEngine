///Determine which animation state the object is in
var map = player_map;
if (!map[? PLAYER_MAP.ANIMATION_OVERRIDE]) {
	//Get state
	scGetNormalAnimationState();
	scDrawNormalAnimationState(map[? PLAYER_MAP.ANIMATION_STATE]);
} else
	scDrawOtherAnimationState(map[? PLAYER_MAP.ANIMATION_STATE]);

//Reduce the players flash amount
map[? PLAYER_MAP.FLASH_ALPHA] = 
	max(map[? PLAYER_MAP.FLASH_ALPHA] - 
	map[? PLAYER_MAP.FLASH_ALPHA_REDUCE], 0);