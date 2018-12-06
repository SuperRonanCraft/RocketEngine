/// @desc Triple rockets

for (var i = 0; i < 5; i++) {
	var dir = 0;
	//Set direction offset
	if (team == TEAM.LEFT)
		dir = 40 - (20 * i);
	else
		dir = 140 + (20 * i);
	//Create the rocket with the new direction
	with (instance_create_layer(x, y, layer, oRocket)) {
		owner = other;
		//Give it the map of the current rocket
		rocket_map = ds_map_create(); 
		ds_map_copy(rocket_map, other.rocket_map);
		rocket_map[? ROCKET_MAP.IGNORE_WALL] = true;
		//Give it the map of the current rocket
		sprite_index = other.rocket_map[? ROCKET_MAP.PROJECTILE];
		//Give it the direction a rocket would fly in
		direction = dir;
		image_angle = direction;
	}
}