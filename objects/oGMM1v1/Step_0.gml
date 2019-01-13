/// @desc spawn pickups
event_inherited();
if (!global.play) exit; //If game play is enabled
var spawn = false
if (pickups_created < pickups_max && spawn_timer < 0) {
	spawn = true;
	spawn_timer = spawn_timer_delay;
} else
	spawn_timer--;
	
//Are we spawning? No, just cancel the event
if (!spawn) exit;
//Generate a random number
var rand = random_range(0, 1);
//80% of the time its a rocket pickup, 15% is a buff, and 5% is health
var obj = oRocketPickup;
if (rand >= 0.8)
	if (rand >= 0.95)
		obj = oHealthPickup;
	else
		obj = oBuffPickup;
var xx = irandom_range(50, RES_W - 50), yy = irandom_range(50, RES_H - 50);
switch (obj) {
	//Is a rocket pickup
	case oRocketPickup:
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
		//Spawn and give it default values
		with (instance_create_depth(xx, yy, depth, obj)) {
			if (x > RES_W / 2)
				image_xscale = -image_xscale;
			sprite_index = map[? ROCKET_MAP.PROJECTILE];
			rocket = map[? ROCKET_MAP.TYPE];
			other.pickups_created++;
			owner = other;
		}
		ds_map_destroy(map);
		break;
	//Is a buff pickup
	case oBuffPickup:
		var possible = 0;
		var index = 0;
		//Get a list of all possible good buffs
		for (var i = 0; i < BUFFTYPE.LENGHT; i++) {
			var map = ds_map_create();
			scBuffGet(i, map);
			//If the buff good? Add it to the possible array
			if (map[? BUFF_MAP.GOOD]) {
				possible[index] = i;
				index++;
			}
			ds_map_destroy(map);
		}
		//Pick a random buff from the possibel good buffs array
		var ind = possible[irandom_range(0, array_length_1d(possible) - 1)];
		//Spawn and give it default values
		with (instance_create_depth(xx, yy, depth, obj)) {
			var map = ds_map_create();
			scBuffGet(ind, map);
			sprite_index = map[? BUFF_MAP.ICON];
			buff = map[? BUFF_MAP.TYPE];
			other.pickups_created++;
			owner = other;
			ds_map_destroy(map);
		}
		break;
	//Is a health pickup
	case oHealthPickup:
		instance_create_depth(xx, yy, depth, obj);
		break;
}