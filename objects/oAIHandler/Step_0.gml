/// @desc AI Ninjas 

if (!instance_exists(player)) exit;
if (!player.system_ai) exit;




switch (aiType) {
	case AI_TYPE.ONEVONE:
		switch (player.weapon_map[? WEAPON_MAP.TYPE]) {
			case WEAPON_TYPE.ARROW:
				scAI1v1Arrow();
				break;
			default:
				scAI1v1Default(true);
				break;
		}
		break;
	case AI_TYPE.ZOMBIE:
		scFindAITarget(500);
		scAICZombie(true);
		break;
	case AI_TYPE.TEST:
		scFindAITarget(500);
		scAITest();
}