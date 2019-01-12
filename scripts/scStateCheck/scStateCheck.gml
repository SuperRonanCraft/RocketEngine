///Check the player states

switch (playerState) {
	case PLAYERSTATE.TECHED:
		overrideAnimation = true;
		
		if(animState == PLAYERSTATE.NORMAL){
			overrideAnimation = false;
			playerState = PLAYERSTATE.NORMAL;	
		}
		
		break;
	
	case PLAYERSTATE.KNOCKBACK:
		canControl = false;
		overrideAnimation = true;
		break;
	
	case PLAYERSTATE.CANTCONTROL:
		canControl = false;
		break;
	
    case PLAYERSTATE.DEAD:
		overrideAnimation = false;
		animState = ANIMATIONSTATE.DEAD;
        canControl = false;
        break;
		
	case PLAYERSTATE.TRAPPED:
        canControl = false;
        break;

    case PLAYERSTATE.NORMAL:
	default:
        canControl = true;
        break;
}

enum PLAYERSTATE {
	NORMAL, DEAD, CANTCONTROL, KNOCKBACK, TECHED, TRAPPED
}