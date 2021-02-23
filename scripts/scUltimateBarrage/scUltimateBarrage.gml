/// @desc LAZEIRS
function scUltimateBarrage() {

	var rocket_map = weapon_map[? WEAPON_MAP.MAP];
	repeat (20) //Spawn 20
		with (instance_create_layer(irandom_range(50, RES_W - 50), irandom_range(-50, -200), layer, oUltimateBarrage)) {
			owner = other;
			sprite_index = rocket_map[? ROCKET_MAP.PROJECTILE];
		}


}
