/// @desc Move player

//MOVE
switch (player_action) {
    case ACTIONS.RIGHT:
        AIRight = true;
		AILeft = false;
        break;
	case ACTIONS.LEFT:
        AILeft = true;
        AIRight = false;
		break;
	case noone:
		AILeft = false;
        AIRight = false;
		break;
	default:
		break;	
}