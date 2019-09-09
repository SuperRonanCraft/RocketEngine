/// @description  hit a wall


if(shuriken_map[?SHURIKEN_MAP.STICK]){
	deactivate = true;
	image_speed = 0;
	depth = other.depth;
}