/// @desc Default rocket Ultimate

with (instance_create_layer(x, y, layer, oRocket)) {
	owner = other;
	//Give it the map of the current rocket
	rocket_map = ds_map_create(); 
	ds_map_copy(rocket_map, other.rocket_map);
	//Give it the map of the current rocket
	sprite_index = other.rocket_map[? ROCKET_MAP.PROJECTILE];
	//Give it the direction a rocket would fly in
	direction = owner.team == TEAM.LEFT ? 0 : 180;
	image_angle = direction;
	//Sizes
	size = 3;
	image_xscale = 3;
	image_yscale = 3;
}