/// @description  
if (other.weapon_map[? WEAPON_MAP.TYPE] == WEAPON.ROCKET && other.owner != owner && !deactivate) {
	event_user(1); //missed
	event_user(0);
	scPlaySound(SOUND.EFFECT_SHUR_WALL);
}

