/// @desc spawn pickups
event_inherited();
if (global.play) { //If game play is enabled
	var spawn = false
	if (pickups_created < pickups_max && spawn_time < 0 && irandom_range(0, 1)) {
		spawn = true;
		spawn_time = 60;
	} else
		spawn_time--;
	//Spawn pickups
	if (spawn) {
		var obj = choose(oRocketPickup, oBuffPickup);
		if (obj == oRocketPickup) {
			var ind = irandom_range(ROCKET.DEFAULT, ROCKET.LENGHT - 1);
			var map = weapons[ind];
			with (instance_create_layer(irandom_range(50, RES_W - 50), irandom_range(50, RES_H - 50), layer, obj)) {
				if (x > RES_W / 2)
					image_xscale = -image_xscale;
				sprite_index = map[? ROCKET_MAP.PROJECTILE];
				rocket = map[? ROCKET_MAP.TYPE];
				other.pickups_created++;
				owner = other;
			}
		} else {
			var possible = 0;
			for (var i = 0; i < BUFFTYPE.LENGHT - 1; i++) {
				var map = ds_map_create();
				scGetBuff(i, map);
				if (map[? BUFF_MAP.GOOD]) {
					var len = array_length_1d(possible);
					possible[(len == 0 ? 0 : len + 1)] = i;
				}
				ds_map_destroy(map);
			}
			var ind = possible[random_range(0, array_length_1d(possible) - 1)];
			with (instance_create_layer(irandom_range(50, RES_W - 50), irandom_range(50, RES_H - 50), layer, obj)) {
				var map = ds_map_create();
				scGetBuff(ind, map);
				sprite_index = map[? BUFF_MAP.ICON];
				buff = map[? BUFF_MAP.TYPE];
				other.pickups_created++;
				owner = other;
				ds_map_destroy(map);
			}
		}
	} 
}

