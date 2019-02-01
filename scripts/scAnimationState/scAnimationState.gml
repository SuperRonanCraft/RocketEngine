///Determine which animation state the object is in

if (!overrideAnimation) {
	//Get state
	scGetNormalAnimationState();
	scDrawNormalAnimationState(animState);
} else
	scDrawOtherAnimationState(animState);

//Reduce the players flash amount
flash_alpha = max(flash_alpha - flash_reduce, 0);