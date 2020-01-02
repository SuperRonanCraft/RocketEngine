/// @desc AI Ninjas 

if (!player.system_ai) exit;

if(movesp == 0){
	movesp = irandom_range(4,15);	
	if(instance_exists(player)){
		player.gravity_map[?GRAVITY_MAP.WALK_SPEED] = movesp;
	}
}


switch (aiType) {
	case AI_TYPE.ONEVONE:
		/*switch (player.weapon_map[? WEAPON_MAP.TYPE]) {
			case WEAPON_TYPE.ARROW:
				scAI1v1Arrow();
				break;
			default:
				scAI1v1Default(true);
				break;
		}
		break;*/
	case AI_TYPE.ZOMBIE:
		scFindAITarget(500);
		scAICZombie(true);
		break;
}