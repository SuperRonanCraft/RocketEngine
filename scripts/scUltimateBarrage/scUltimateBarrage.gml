/// @desc LAZEIRS

repeat (20) //Spawn 20
	with (instance_create_layer(irandom_range(50, RES_W - 59), irandom_range(-50, -150), layer, oUltimateBarrage)) {
		owner = other;
		sprite_index = owner.rocket_map[? ROCKET_MAP.PROJECTILE];
	}