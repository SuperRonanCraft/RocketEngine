/// @desc Sand Storm Ultimate
with (instance_create_depth(x, y, depth - 1, oUltimateHugesplosion)) {
	owner = other;
	//sprite_index = owner.rocket_map[? ROCKET_MAP.PROJECTILE]
}