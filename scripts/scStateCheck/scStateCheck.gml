///Check the player states

switch (playerState) {
	case PLAYERSTATE.KNOCKBACK:
		overrideAnimation = true;
		animState = ANIMATIONSTATE.KNOCKBACK;
		break;
	
	case PLAYERSTATE.CANTCONTROL:
		canControl = false;
		break;
	
    case PLAYERSTATE.DEAD:
		overrideAnimation = false;
		animState = ANIMATIONSTATE.DEAD;
        canControl = false;
        break;
    default:
        canControl = true;
        break;
}