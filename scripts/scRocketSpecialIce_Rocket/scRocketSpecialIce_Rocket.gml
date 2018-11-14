///@desc Ice rocket hits a rocket object.
///@arg rocket Rocket id

//initialize variables
var hit = argument0;


//Don't blow up if you hit the player's other rockets
if(hit.owner != owner){
	collideRocket = 1;
	
	if(hit.name == "Ice Rocket"){
		scRocketSpecialIce_Explode(3);
	}
	else{
		scRocketSpecialIce_Explode(1.5);	
	}
}
