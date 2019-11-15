//Shoot a weapon

/// @desc checks the cooldown, if so, start the next cooldown
// @arg force the cooldown

var map = weapon_map;

if ((map[? WEAPON_MAP.ENABLED] && map[? WEAPON_MAP.RELOAD_TIME] <= 0 && map[? WEAPON_MAP.COOLDOWN_TIME] == 0) || (argument_count > 0 ? argument[0] : false))
	switch (map[? WEAPON_MAP.TYPE]) {
		case WEAPON.ROCKET:
			var rocket_map = map[? WEAPON_MAP.MAP];
			map[? WEAPON_MAP.COOLDOWN_TIME] = rocket_map[? ROCKET_MAP.COOLDOWN];
			map[? WEAPON_MAP.DELAY_TIME] = rocket_map[? ROCKET_MAP.STARTUP];
			break;
		case WEAPON.SHURIKEN:
			var shuriken_map = map[? WEAPON_MAP.MAP];
			map[? WEAPON_MAP.COOLDOWN_TIME] = shuriken_map[? SHURIKEN_MAP.COOLDOWN];
			map[? WEAPON_MAP.DELAY_TIME] = shuriken_map[? SHURIKEN_MAP.STARTUP];
			break;
		case WEAPON.ARROW:
			var arrow_map = map[? WEAPON_MAP.MAP];
			map[? WEAPON_MAP.COOLDOWN_TIME] = arrow_map[? ARROW_MAP.COOLDOWN];
			map[? WEAPON_MAP.DELAY_TIME] = arrow_map[? ARROW_MAP.STARTUP];
			//map[? WEAPON_MAP.START_DELAY] = true;
			
			break;			
	}