/// @description  hit a wall


if(shuriken_map[?SHURIKEN_MAP.STICK]){
	deactivate = true;
	image_speed = 0;
	depth = irandom_range(-2,1) + other.depth;
}