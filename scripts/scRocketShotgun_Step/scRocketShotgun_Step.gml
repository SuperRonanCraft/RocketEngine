var map = shotgunMap;

if (map[? "dist_trv"] > map[? "dist"]) {
	var dir = direction - 15;
	for (var i = 0; i < 4; i++) {
		var rocket = scSpawnRocket(x, y, depth, dir, owner, weapon_map, [ROCKET_MAP.ROCKET_STEP, ROCKET_MAP.SCALE,
			ROCKET_MAP.OFFSET, ROCKET_MAP.TIMER], [noone, 0.5, 15, room_speed / 2]);
		rocket.size = 0.5;
		var spd = 10;
		rocket.x += lengthdir_x(spd, dir);
		rocket.y += lengthdir_y(spd, dir);
		dir += 10;
	}
	event_user(0); //Explode this rocket
} else {
	var spd = weapon_map[? WEAPON_MAP.SPEED];
	scMovementLine(spd, direction);
	map[? "dist_trv"] += spd;
}