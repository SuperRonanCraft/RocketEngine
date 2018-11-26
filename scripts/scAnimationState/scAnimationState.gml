///Determine which animation state the object is in

animationVar += image_speed;

if(!overrideAnimation){
	
	//Get state
	scGetNormalAnimationState();	
	scDrawNormalAnimationState(animState);
}