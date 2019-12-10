/// @desc AI Ninjas 

if (!player.system_ai) exit;

switch (aiType) {
	case AI_TIME.ONEVONE:
		switch (player.weapon_map[? WEAPON_MAP.TYPE]) {
			case WEAPON.ARROW:
				scAI1v1Arrow();
				break;
			default:
				scAI1v1Default(true);
				break;
		}
		break;
	case AI_TIME.ZOMBIE:
		break;
}