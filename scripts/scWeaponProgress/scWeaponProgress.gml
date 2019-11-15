//Progress a weapon (step event of weapon)

var map = weapon_map;

switch (map[? WEAPON_MAP.TYPE]) {
	case WEAPON.ROCKET:
		scRocketProgress(team);
		break;
	case WEAPON.SHURIKEN:
		scShurikenProgress(team);
		break;
	case WEAPON.ARROW:
		scArrowProgress(team);
		break;
}