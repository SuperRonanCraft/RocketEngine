/// @desc Move player

if (!tutorial_start) exit;

switch (tutorial_part) {
	case 0:
		event_user(0);
		break;
	default:
		break;
}
player_action_time++;

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