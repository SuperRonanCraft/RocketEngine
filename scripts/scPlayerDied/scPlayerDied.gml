function scPlayerDied() {
	if (display)
		with (pGMM){
			event_user(1);
		}
	else{
		if(instance_exists(oGMMDeathmatch))
			oGMMDeathmatch.chars--;
	}

}
