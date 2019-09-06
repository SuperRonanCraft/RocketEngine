///Determine which animation state the object is in
var map = playerMap;
if (!map[? PLAYER_MAP.ANIMATION_OVERRIDE]) {
	//Get state
	scGetNormalAnimationState();
	scDrawNormalAnimationState(map[? PLAYER_MAP.ANIMATION_STATE]);
} else
	scDrawOtherAnimationState(map[? PLAYER_MAP.ANIMATION_STATE]);

//Reduce the players flash amount
playerMap[? PLAYER_MAP.FLASH_ALPHA] = 
	max(playerMap[? PLAYER_MAP.FLASH_ALPHA] - 
	playerMap[? PLAYER_MAP.FLASH_ALPHA_REDUCE], 0);