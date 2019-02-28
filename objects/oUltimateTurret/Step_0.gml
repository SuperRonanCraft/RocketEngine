/// @desc fire rockets

turret_cd--;
if (turret_cd <= 0) {
	var offset = owner.rocket_map[? ROCKET_MAP.OFFSET];
	scSpawnRocket(x + lengthdir_x(offset, direction), y, depth + 1, direction, owner, owner.rocket_map, [ROCKET_MAP.ULTIMATE_CHARGE_GIVE], [false]);
	turret_cd = turret_rate;
}