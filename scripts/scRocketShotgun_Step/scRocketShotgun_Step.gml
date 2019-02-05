if (abs(lengthdir_x(abs(xstart - x), direction)) + abs(lengthdir_y(abs(ystart - y), direction)) > RES_W / 6) {
	var dir = direction - 15;
	for (var i = 0; i < 4; i++) {
		var rocket = scSpawnRocket(x, y, depth, dir, owner, rocket_map, [ROCKET_MAP.ROCKET_STEP, ROCKET_MAP.SCALE,
			ROCKET_MAP.OFFSET], [noone, 0.5, 15]);
		rocket.size = 0.5;
		var spd = 10;
		rocket.x += lengthdir_x(spd, dir);
		rocket.y += lengthdir_y(spd, dir);
		dir += 10;
	}
	event_user(0); //Explode this rocket
} else {
	var spd = rocket_map[? ROCKET_MAP.SPEED];
	scMovementLine(spd, direction);
}