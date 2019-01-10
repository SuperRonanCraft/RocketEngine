/// @desc Spawn an oRocket and return the object but first give it defaults
/// @arg x
/// @arg y
/// @arg depth
/// @arg direction-image_direction
/// @arg owner The owner of the new rocket
/// @arg rocket_map Rocket map of the new rocket
/// @arg rocket_map-keys* An array of rocket_map keys
/// @arg rocket_map-values* An array of rocket_map values

var xx = argument[0];
var yy = argument[1];
var dep = argument[2];
var dir = argument[3]
var own = argument[4];
var map = ds_map_create();
ds_map_copy(map, argument[5]);
var inst = instance_create_depth(xx, yy, dep, oRocket);

//ROCKET_MAP
//Set all the values for the two arrays given to the map, reducing programming repetition
if (argument_count >= 8) { //Must have both keys and values
	var keys = argument[6]
	var values = argument[7];
	for (var i = 0; i < array_length_1d(keys); i++)
		ds_map_set(map, keys[i], values[i]);
}

//All defaults
with (inst) {
	owner = own;
	rocket_map = map;
	direction = dir;
	image_angle = direction;
	if (direction > 90 && direction < 270)
		image_yscale *= -1;
	sprite_index = rocket_map[? ROCKET_MAP.PROJECTILE];
	timer = rocket_map[? ROCKET_MAP.TIMER];
}

return inst;