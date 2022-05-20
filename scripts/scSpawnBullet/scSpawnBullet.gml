/// @desc Spawn an oShuriken and return the object but first give it defaults
/// @arg x
/// @arg y
/// @arg depth
/// @arg direction-image_direction
/// @arg owner The owner of the new shuriken
/// @arg shuriken_map Shuriken map of the new shuriken
/// @arg shuriken_map-keys* An array of shuriken_map keys
/// @arg shuriken_map-values* An array of shuriken_map values
function scSpawnBullet() {

	var xx = argument[0];
	var yy = argument[1];
	var dep = argument[2];
	var dir = argument[3]
	var own = argument[4];
	var map = argument[5];
	var w_map = ds_map_create();
	//ds_map_copy(w_map, argument[5]);
	var inst = instance_create_depth(xx, yy, dep, oBullet);

	//show_debug_message("SIZE " + string(ds_map_size(map)));
	//show_debug_message("VALUE " + string(WEAPON_MAP.MAP));

	for (var i = 0; i < ds_map_size(map); i++) {
		if (i != WEAPON_MAP.MAP)
			ds_map_set(w_map, i, map[? i]);
		else {
			//show_debug_message("WEapon map here!");
			var new_map = ds_map_create();
			ds_map_copy(new_map, map[? i]);
			ds_map_set(w_map, i, new_map);
		}
	}

	//BULLET_MAP
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
		
		//Moved to progress
		//if (!instance_exists(target)){
		//	target = scFindTarget(owner.team);
		//	if(instance_exists(target))
		//		dir = point_direction(x,y,target.x,target.bbox_top);
		//}
		
		
		if (dir > 90 && dir < 270) {
			facing = -1;
		} 
		direction = dir;
		image_angle = direction;
		var bullet_map = weapon_map[? WEAPON_MAP.MAP];
		sprite_index = bullet_map[? BULLET_MAP.PROJECTILE];
		//timer = rocket_map[? ROCKET_MAP.TIMER];
		//SCALE
		var scale = bullet_map[? BULLET_MAP.SCALE];
		original_xscale = scale;
		original_yscale = scale;
	
		//timer = bullet_map[? BULLET_MAP.TIMER];
		spd = bullet_map[? BULLET_MAP.SPEED];
	
		dmg = bullet_map[? BULLET_MAP.DAMAGE];
		kb = bullet_map[? BULLET_MAP.KBAMT];
		
		hsp = lengthdir_x(spd, dir);
		vsp = lengthdir_y(spd, dir);
		
		//CREATE
	
		/*
		if (bullet_map[? BULLET_MAP.BULLET_CREATE] != noone) //Script to run when a rocket has been created
			script_execute(bullet_map[? BULLET_MAP.BULLET_CREATE]);
		*/

	}

	return inst;


}
