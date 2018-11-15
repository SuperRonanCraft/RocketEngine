///@desc Ice rocket hits a rocket object.
///@arg rocket Rocket id

//initialize variables
var hit = argument0;


//Don't blow up if you hit the player's other rockets
if(hit.owner != owner){

	collideRocket = 1;
	
	//If you hit an ice rocket, explode 3x as much
	if(hit.name == "Fire Rocket"){
		scRocketSpecialFire_Explode(3);
	}
	
	else if(hit.name == "Ice Rocket"){
		scRocketSpecialFire_Explode(0);	
	}

	else{
		scRocketSpecialFire_Explode(1.5);	
	}
}
