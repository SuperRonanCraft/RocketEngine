/// @desc cycle item
if (!global.play) exit; //Dont start unless game has started

if (timer_current <= 0) {
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
	item = map[? ROCKET_MAP.PROJECTILE];
	item_rocket = map[? ROCKET_MAP.TYPE];
	ds_map_destroy(map);
	timer_current = timer; //Reset the timer
} else
	timer_current--;

