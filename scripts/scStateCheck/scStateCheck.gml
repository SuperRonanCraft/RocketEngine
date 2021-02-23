///Check the player states
function scStateCheck() {

	var map = player_map;

	switch (map[? PLAYER_MAP.PLAYER_STATE]) {
		case PLAYERSTATE.TECHED:
			map[? PLAYER_MAP.ANIMATION_OVERRIDE] = true;
			if (map[? PLAYER_MAP.ANIMATION_STATE] == PLAYERSTATE.NORMAL){
				map[? PLAYER_MAP.ANIMATION_OVERRIDE] = false;
				map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.NORMAL;	
			}
			break;
		case PLAYERSTATE.KNOCKBACK:
		
			map[? PLAYER_MAP.CAN_CONTROL] = false;
			if(map[? PLAYER_MAP.ALIVE])
				map[? PLAYER_MAP.ANIMATION_OVERRIDE] = true;
			break;
		case PLAYERSTATE.CANTCONTROL:
		case PLAYERSTATE.ABILITYCHANNEL:
			map[? PLAYER_MAP.CAN_CONTROL] = false;
			break;
	    case PLAYERSTATE.DEAD:
			map[? PLAYER_MAP.ANIMATION_OVERRIDE] = false;
	        map[? PLAYER_MAP.CAN_CONTROL] = false;
	        break;
		case PLAYERSTATE.WAKING:
			map[? PLAYER_MAP.ANIMATION_OVERRIDE] = true;
			map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.WAKING;
	        map[? PLAYER_MAP.CAN_CONTROL] = false;
	        break;
		case PLAYERSTATE.SLEEPING:
			map[? PLAYER_MAP.ANIMATION_OVERRIDE] = true;
			map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.SLEEPING;
	        map[? PLAYER_MAP.CAN_CONTROL] = false;
	        break;
		case PLAYERSTATE.TRAPPED:
			map[? PLAYER_MAP.ANIMATION_OVERRIDE] = true;
			map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.TRAPPED;
	        map[? PLAYER_MAP.CAN_CONTROL] = false;
	        break;
		case PLAYERSTATE.FROZEN:
			map[? PLAYER_MAP.ANIMATION_OVERRIDE] = true;
			map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.FROZEN;
	        map[? PLAYER_MAP.CAN_CONTROL] = false;
		
			break;
	    case PLAYERSTATE.NORMAL:
		default:
	        map[? PLAYER_MAP.CAN_CONTROL] = true;
	        break;
	}

	enum PLAYERSTATE {
		NORMAL, DEAD, CANTCONTROL, KNOCKBACK, TECHED, TRAPPED, SLEEPING, WAKING, FROZEN,
		ABILITYCHANNEL,
	}


}
