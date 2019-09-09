//Progress a weapon (step event of weapon)

var map = weapon_map;

switch (map[? WEAPON_MAP.TYPE]) {
	case WEAPON.ROCKET:
		scRocketProgress(!shoot_face ? team : -1);
		break;
	case WEAPON.SHURIKEN:
		scShurikenProgress(!shoot_face ? team : -1);
		break;
}