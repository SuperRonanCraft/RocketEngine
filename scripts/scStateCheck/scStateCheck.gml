///Check the player states

switch (playerState) {
    case PLAYERSTATE.DEAD:
		animState = ANIMATIONSTATE.DEAD;
        canControl = false;
        break;
    default:
        canControl = true;
        break;
}