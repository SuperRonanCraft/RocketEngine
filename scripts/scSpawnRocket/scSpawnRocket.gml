/// @desc Spawn an oRocket and return the object but first give it defaults
/// @arg x
/// @arg y
/// @arg depth
/// @arg direction-image_direction
/// @arg owner The owner of the new rocket
/// @arg weapon_map Weapon map of the new rocket
/// @arg weapon_map.map-keys* An array of rocket_map keys
/// @arg weapon_map.map-values* An array of rocket_map values

var xx = argument[0];
var yy = argument[1];
var dep = argument[2];
var dir = argument[3]
var own = argument[4];
var map = argument[5];
var w_map = ds_map_create();
//ds_map_copy(w_map, argument[5]);
//var r_map = ds_map_create(); //custom weapon map
//ds_map_copy(r_map, argument[5]);
var inst = instance_create_depth(xx, yy, dep, oRocket);

for (var i = 0; i < ds_map_size(map); i++) {
	if (i != WEAPON_MAP.MAP)
		ds_map_set(w_map, i, map[? i]);
	else {
		var new_map = ds_map_create();
		ds_map_copy(new_map, map[? i]);
		ds_map_set(w_map, i, new_map);
	}
}

//ROCKET_MAP
//Set all the values for the two arrays given to the map, reducing programming repetition
var r_map = w_map[? WEAPON_MAP.MAP];
if (argument_count >= 8) { //Must have both keys and values
	var keys = argument[6]
	var values = argument[7];
	for (var i = 0; i < array_length_1d(keys); i++)
		ds_map_set(r_map, keys[i], values[i]);
}

if (r_map[? ROCKET_MAP.SOUND_SHOOT] != undefined)
	scPlaySound(r_map[? ROCKET_MAP.SOUND_SHOOT], random_range(0.8, 1.2), noone, false);
scScreenShake(r_map[? ROCKET_MAP.SHAKE_MAGNITUDE], r_map[? ROCKET_MAP.SHAKE_FRAMES]);

//All defaults
with (inst) {
	owner = own;
	weapon_map = w_map;
	direction = dir;
	image_angle = direction;
	image_index = irandom(image_number - 1);
	if (direction > 90 && direction < 270)
		image_yscale *= -1;
	var rocket_map = weapon_map[? WEAPON_MAP.MAP];
	sprite_index = rocket_map[? ROCKET_MAP.PROJECTILE];
	//timer = rocket_map[? ROCKET_MAP.TIMER];
	//SCALE
	var scale = rocket_map[? ROCKET_MAP.SCALE];
	original_xscale = scale;
	original_yscale = scale;
	//CREATE
	if (rocket_map[? ROCKET_MAP.ROCKET_CREATE] != noone) //Script to run when a rocket has been created
		script_execute(rocket_map[? ROCKET_MAP.ROCKET_CREATE]);
}

return inst;