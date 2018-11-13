///@desc Ice rocket hits shootable object.
///@arg Shootable object

//initialize variables
var hit = argument0;

//Make sure you aren't hurting yourself
if(hit != owner){
	addBuff(hit, "Chilled",3,false,0);
	scRocketSpecialIce_Explode(2);
}

if(destroy){
	instance_destroy();	
}