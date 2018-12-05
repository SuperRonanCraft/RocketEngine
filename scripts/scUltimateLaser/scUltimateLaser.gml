/// @desc LAZEIRS

repeat (20) //Spawn 20
	with (instance_create_layer(irandom_range(50, RES_W - 59), -50, layer, oUltimateLasers)) {
		owner = other;
		sprite_index = owner.rocket_map[? ROCKET_MAP.PROJECTILE];
	}