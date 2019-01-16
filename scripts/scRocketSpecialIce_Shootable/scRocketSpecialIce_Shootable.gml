///@desc Ice rocket hits shootable object.
///@arg Shootable object

//initialize variables
var hit = argument0;


//Make sure you aren't hurting yourself
if (hit != owner) {
	
	//A direct hit should reward the player, giving 1.5 more seconds
	//of debuff time rather than getting hit by the explosion
	//scBuffAdd(rocket_map[? ROCKET_MAP.BUFF], hit, 3);
	
	//The explosion still happens because, well, it looks cool
	//Plus it provides visual feedback to the receiver that they got hit
	scRocketSpecialIce_Explode(1);
	
	//The explosion does NOT apply the debuff. 
	//This is because addBuff checks if the buff isn't there.
	//Check addBuff for more info.
}

//This script is run when the rocket hits a shootable.
//Check oRocket's collision event with a shootable for more info.