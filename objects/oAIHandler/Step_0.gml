/// @desc AI Ninjas 

//Choose a direction to randomly walk in
switch (randDirection) {
    case ACTIONS.RIGHT:
        AIRight = true;
		AILeft = false;
        break;
		
	case ACTIONS.LEFT:
        AILeft = true;
        AIRight = false;
		break;
	
	case noone:
	default:
		break;
		
}

//If you stand, have a 'chance' to jump
if (player.standing) {
	if (timer % irandom_range(2, 70) == 0) {
		AIJump = true;	
	}
} else {
	AIJump = false;	
}

//As long as you live, shoot!
if (!ultReady && player.alive) {
	AIShoot = true;	
} else {
	AIShoot = false;	
}

//If ult is ready, fire IMMEDIATELY
if (player.ult_charge >= player.ult_charge_max) {
	ultReady = true;
	AIRight = true;
	AILeft = true;
} else {
	ultReady = false;	
}

AIUlt = ultReady;

//Reset timer
if (timer < 0) {
	timer = irandom_range(30, 120);	
	
	if (!ultReady)
		randDirection = irandom_range(0, 1);
	else
		randDirection = noone;	
	
} else {
	timer--;	
}

