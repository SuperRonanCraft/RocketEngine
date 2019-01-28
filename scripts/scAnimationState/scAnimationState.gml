///Determine which animation state the object is in

if (!overrideAnimation) {
	//Get state
	scGetNormalAnimationState();
	scDrawNormalAnimationState(animState);
} else
	scDrawOtherAnimationState(animState)	
