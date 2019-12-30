//Progress a weapon (step event of weapon)
///@arg weapon-map

var map = argument0;
show_debug_message("Weapon Progress " + string(map[? WEAPON_MAP.TYPE]) + " " + string(random(5)))

switch (map[? WEAPON_MAP.TYPE]) {
	case WEAPON_TYPE.ROCKET:
		scRocketProgress(map);
		break;
	case WEAPON_TYPE.SHURIKEN:
		scShurikenProgress(map);
		break;
	case WEAPON_TYPE.ARROW:
		scArrowProgress(map);
		break;
}