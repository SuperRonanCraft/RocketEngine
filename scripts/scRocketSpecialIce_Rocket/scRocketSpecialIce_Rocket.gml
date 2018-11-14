///@desc Ice rocket hits a rocket object.
///@arg rocket Rocket id

//initialize variables
var hit = argument0;


//Don't blow up if you hit the player's other rockets
if(hit.owner != owner){
	//This variable is CRUCIAL for avoiding crashes.
	//This prevents the instance from disappearing before the other
	//rocket finishes it's checks on (this) rocket.
	//Basically: Always include it in rocket-rocket collisions
	collideRocket = 1;
	
	//If you hit an ice rocket, explode 3x as much
	if(hit.name == "Ice Rocket"){
		scRocketSpecialIce_Explode(3);
	}
	
	//Otherwise, a smaller explosion mostly to show what happened
	//This can still hurt/affect the opposing player if they are close enough
	else{
		scRocketSpecialIce_Explode(1.5);	
	}
}

//This script runs if the object hits another rocket object.
//Check oRocket's oRocket collision event for more info.
//If the same rocket hits this one, they individually run this, one after the other.