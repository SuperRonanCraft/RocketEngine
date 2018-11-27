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
		var ind = irandom_range(1, ROCKET.LENGHT - 1);
		var map = weapons[ind]
		with (instance_create_layer(irandom_range(50, RES_W - 50), irandom_range(50, RES_H - 50), layer, oRocketPickup)) {
			if (x > RES_W / 2)
				image_xscale = -image_xscale;
			sprite_index = map[? ROCKET_MAP.PROJECTILE];
			rocket = map[? ROCKET_MAP.TYPE];
			other.pickups_created++;
			owner = other;
		}
	} 
}

