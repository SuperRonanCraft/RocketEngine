///@desc Ice rocket hits a wall.
///@arg Wall id

//initialize variables
var hit = argument0;


//If you're hitting a wall that you shoot
if (hit.shootable && !rocket_map[? ROCKET_MAP.IGNORE_WALL])
	//Simply explode bigger than when you hit a shootable
	//This way there is actually a reason to avoid the blast
	scRocketSpecialIce_Explode(2);


//This script runs when the object hits a wall.
//Check oRocket's wall collision event for more info.
