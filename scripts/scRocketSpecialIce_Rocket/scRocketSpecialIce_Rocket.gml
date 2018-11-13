///@desc Ice rocket hits a rocket object.
///@arg rocket Rocket id

//initialize variables
var hit = argument0;

//simple explosion for now
scRocketSpecialIce_Explode(1.5);	

if(destroy){
	instance_destroy();	
}