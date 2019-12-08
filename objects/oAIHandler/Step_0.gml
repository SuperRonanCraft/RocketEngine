/// @desc AI Ninjas 

switch (player.weapon_map[? WEAPON_MAP.TYPE]) {
	case WEAPON.ARROW:
		scAIArrow();
		break;
	default:
		scAIRocket(true);
		break;
}