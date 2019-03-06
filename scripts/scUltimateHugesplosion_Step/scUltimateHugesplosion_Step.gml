var map = hugeMap;

var spd = map[? "spd"] * owner.time_dialation;
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
map[? "dis_crt"] += spd;

if (map[? "dis_crt"] >= map[? "dis"] || (!map[? "exploded"] && destroy)) { //Check distance travelled
	var amt = map[? "amt"];
	var dir = -(360 / amt) / 2;
	for (var i = 0; i < amt; i++) {
		dir += (360 / amt);
		with (scSpawnRocket(x, y, depth, dir, owner, rocket_map, [ROCKET_MAP.ROCKET_STEP], [noone])) {
			x += lengthdir_x(20, direction);
			y += lengthdir_y(20, direction);
			sprite_index = map[? "sprite"];
			ds_list_copy(hitList, other.hitList);
		}
	}
	map[? "exploded"] = true;
	event_user(0); //Explode this rocket
}