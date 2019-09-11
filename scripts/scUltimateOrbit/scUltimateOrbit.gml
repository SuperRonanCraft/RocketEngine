var side = argument[0] == 0 ? 1 : -1;
var map = argument[1];

var dis = map[? "dis"];
var amt = map[? "amt"];
var dir = 360 / amt;
var keys = [ROCKET_MAP.ROCKET_CREATE, ROCKET_MAP.ROCKET_STEP, ROCKET_MAP.EXPLOSION_ROCKET, 
	ROCKET_MAP.ROCKET_DESTROY, ROCKET_MAP.ROCKET_AUTO_DESTROY_ROOM, ROCKET_MAP.TIMER];
var values = [scUltimateOrbit_RocCreate, scUltimateOrbit_RocStep, scUltimateOrbit_RocExplosionRoc, 
	scUltimateOrbit_RocDestroy, false, room_speed * 10];
var map = weapon_map;
for (var i = 0; i < amt; i++)
	with (scSpawnRocket(x, y, depth + 1, dir * i, id, map, keys, values)) {
		orbitMap[? "dis"] = map[? "dis"];
		orbitMap[? "dir_chg"] += irandom_range(0, 5);
		orbitMap[? "dir_chg"] *= choose(1, -1);
		orbitMap[? "rotation"] *= side;
		var rocket_map = weapon_map[? WEAPON_MAP.MAP];
		rocket_map[? ROCKET_MAP.TIMER] += irandom(room_speed);
	}
