/// @desc Spawn an oShuriken and return the object but first give it defaults
/// @arg x
/// @arg y
/// @arg depth
/// @arg direction-image_direction
/// @arg owner The owner of the new shuriken
/// @arg shuriken_map Shuriken map of the new shuriken
/// @arg shuriken_map-keys* An array of shuriken_map keys
/// @arg shuriken_map-values* An array of shuriken_map values
function scSpawnShuriken() {

	var xx = argument[0];
	var yy = argument[1];
	var dep = argument[2];
	var dir = argument[3]
	var own = argument[4];
	var map = argument[5];
	var w_map = ds_map_create();
	//ds_map_copy(w_map, argument[5]);
	var inst = instance_create_depth(xx, yy, dep, oShuriken);

	//show_debug_message("SIZE " + string(ds_map_size(map)));
	//show_debug_message("VALUE " + string(WEAPON_MAP.MAP));

	for (var i = 0; i < ds_map_size(map); i++) {
		if (i != WEAPON_MAP.MAP)
			ds_map_set(w_map, i, map[? i]);
		else {
			var new_map = ds_map_create();
			ds_map_copy(new_map, map[? i]);
			ds_map_set(w_map, i, new_map);
		}
	}

	//SHURIKEN_MAP
	//Set all the values for the two arrays given to the map, reducing programming repetition
	var s_map = w_map[? WEAPON_MAP.MAP];
	if (argument_count >= 8) { //Must have both keys and values
		var keys = argument[6]
		var values = argument[7];
		for (var i = 0; i < array_length(keys); i++)
			ds_map_set(s_map, keys[i], values[i]);
	}

	//All defaults
	with (inst) {
		owner = own;
		weapon_map = w_map;
		direction = dir;
		image_angle = direction;
		if (direction > 90 && direction < 270)
			image_yscale *= -1;
		var shuriken_map = weapon_map[? WEAPON_MAP.MAP];
		sprite_index = shuriken_map[? SHURIKEN_MAP.PROJECTILE];
		//timer = rocket_map[? ROCKET_MAP.TIMER];
		//SCALE
		var scale = shuriken_map[? SHURIKEN_MAP.SCALE];
		original_xscale = scale;
		original_yscale = scale;
		//CREATE
	
		/*
		if (shuriken_map[? SHURIKEN_MAP.SHURIKEN_CREATE] != noone) //Script to run when a rocket has been created
			script_execute(shuriken_map[? SHURIKEN_MAP.SHURIKEN_CREATE]);
		*/

	}

	return inst;


}
