/// @description  hit a wall


if(shuriken_map[?SHURIKEN_MAP.STICK] && other.shootable || other.is_wall){
	deactivate = true;
	image_speed = 0;
	depth = other.depth;
}