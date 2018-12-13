/// @desc Default ultimate
with (scSpawnRocket(x, y, depth + 1, owner.team == TEAM.LEFT ? 0 : 180, id, rocket_map)) {
	rocket_map[? ROCKET_MAP.DAMAGE] *= 3;
	//Sizes
	size = 3;
	
	//Scales
	original_xscale = 3;
	original_yscale = 3;
	//Speed to grow the rocket
	scale_speed = ((image_xscale + image_yscale) / 2) / 10;
	image_xscale /= 4;
	image_yscale /= 4;
}