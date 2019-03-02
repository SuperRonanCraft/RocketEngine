//To be used as "pickup" on rocket_map
var roc = argument0;

timer = room_speed * 10;
timer_current = timer;
hacked = true; //hacked the pickup
switch (object_index) {
	case oPickupRocket: //RANDOM ROCKET
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
		item_rocket = map[? ROCKET_MAP.TYPE];
		ds_map_destroy(map);
		break;
	case oPickupBuff: //RANDOM BAD BUFF
		var possible = 0;
		var index = 0;
		//Get a list of all possible BAD buffs
		for (var i = 0; i < BUFFTYPE.LENGHT; i++) {
			var map = ds_map_create();
			scBuffGet(i, map);
			//If the buff is BAD? Add it to the possible array
			if (!map[? BUFF_MAP.GOOD]) {
				possible[index] = i;
				index++;
			}
			ds_map_destroy(map);
		}
		//Pick a random buff from the possible BAD buffs array
		var ind = possible[irandom_range(0, array_length_1d(possible) - 1)];
		var map = ds_map_create();
		scBuffGet(ind, map);
		item_buff = map[? BUFF_MAP.TYPE];
		ds_map_destroy(map);
		break;
	case oPickupHealth: //ANTI HEAL
		healing *= -1;
		break;
}

roc.rocket_map[? ROCKET_MAP.HIT_PICKUP] = noone;