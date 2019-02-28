var map = hugeMap;

var spd = map[? "spd"] * owner.time_dialation;
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
map[? "dis_crt"] += spd;

if (map[? "dis_crt"] >= map[? "dis"]) { //Check distance travelled
	var amt = map[? "amt"];
	var dir = -(360 / amt) / 2;
	for (var i = 0; i < amt; i++) {
		dir += (360 / amt);
		with (scSpawnRocket(x, y, depth, dir, owner, rocket_map, [ROCKET_MAP.ROCKET_STEP], [noone])) {
			x += lengthdir_x(10, direction);
			y += lengthdir_y(10, direction);
			sprite_index = map[? "sprite"];
		}
	}
	event_user(0); //Explode this rocket
}