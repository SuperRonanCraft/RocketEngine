///Determine which animation state the object is in
var map = playerMap;
if (!map[? PLAYER_MAP.ANIMATION_OVERRIDE]) {
	//Get state
	scGetNormalAnimationState();
	scDrawNormalAnimationState(map[? PLAYER_MAP.ANIMATION_STATE]);
} else
	scDrawOtherAnimationState(map[? PLAYER_MAP.ANIMATION_STATE]);

//Reduce the players flash amount
flash_alpha = max(flash_alpha - flash_reduce, 0);