/// @desc AI Ninjas 

if (!player.system_ai) exit;



scFindAITarget();

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
		scAICZombie(true);
		break;
}