function scPlayerDied() {
	if (display)
		with (pGMM){
			event_user(1);
		}
	else{
		if(instance_exists(oGMMDeathmatch))
			oGMMDeathmatch.chars--;
		else{//Party mode
			global.time_dilation_target = 0.1;
			scScreenShake(50,60);
			if(instance_number(oPlayer) <= 2){
				//oTransition.timer = 60;
				if(room != rParty11)
					SlideTransition(TRANS_MODE.GOTO,room_next(room))	
				else{
					SlideTransition(TRANS_MODE.GOTO,rParty1);
					global.changeChars = true;
				}
			}
		}
	}

}
