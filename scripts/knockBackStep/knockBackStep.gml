//Checks every step

if (knockback_time <= 0) exit; //No knockback, exit
knockback_time--;

//knockback time was just set to 0, do the following
if (hsp == 0 || vsp == 0 || knockback_time == 0) {
	hsp_knockback = 0;
	vsp_knockback = 0;
}
if (hsp_knockback == 0 && vsp_knockback == 0){
	overrideAnimation = false;
	playerState = PLAYERSTATE.NORMAL;
}


/*
if(!( (teched || standing) )){
	
	canControl = false;
	overrideAnimation = true;
	animState = ANIMATIONSTATE.KNOCKBACK;
}
else{
	teched = false;
	canControl = true;
	overrideAnimation = false;
	playerState = PLAYERSTATE.NORMAL;
}*/