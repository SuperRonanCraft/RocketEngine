/// @description  hit a wall


if(!deactivate && shuriken_map[?SHURIKEN_MAP.STICK] && other.shootable || other.is_wall){
	deactivate = true;
	image_speed = 0;
	depth = other.depth;
	scPlaySound(SOUND.EFFECT_SHUR_WALL);
}