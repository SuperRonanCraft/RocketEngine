///@desc Ice rocket hits shootable object.
///@arg Shootable object
function scRocketSpecialFire_Shootable(argument0) {

	//initialize variables
	var hit = argument0;

	//Make sure you aren't hurting yourself
	if (hit != owner)
		scRocketSpecialFire_Explode(1);




}
