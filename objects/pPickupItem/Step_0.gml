/// @desc cycle item

if (current_cooldown <= 0) {
	current_cooldown = cooldown;
	var possible = 0;
	var index = 0;
	//Get a list of all enabled rockets
	for (var i = ROCKET.DEFAULT; i < ROCKET.LENGHT; i++) {
		var wp_map = scRocketGet(i);
		if (is_undefined(wp_map[? ROCKET_MAP.ENABLED]) || wp_map[? ROCKET_MAP.ENABLED]) {
			possible[index] = i;
			index++;
		}
		ds_map_destroy(wp_map);
	}
	//Pick a random rocket from the possible array
	var map = scRocketGet(possible[irandom_range(0, array_length_1d(possible) - 1)]);
	current_item = map[? ROCKET_MAP.PROJECTILE];
	ds_map_destroy(map);
} else
	current_cooldown--;
