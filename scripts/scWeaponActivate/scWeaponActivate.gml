//Shoot a weapon

/// @desc checks the cooldown, if so, start the next cooldown
// @arg force the cooldown

var map = weapon_map;

if ((map[? WEAPON_MAP.ENABLED] && map[? WEAPON_MAP.RELOAD_TIME] <= 0 && map[? WEAPON_MAP.COOLDOWN_TIME] == 0) || (argument_count > 0 ? argument[0] : false))
	switch (map[? WEAPON_MAP.TYPE]) {
		case WEAPON.ROCKET:
			map[? WEAPON_MAP.COOLDOWN_TIME] = rocket_map[? ROCKET_MAP.COOLDOWN];
			map[? WEAPON_MAP.STARTUP_TIME] = rocket_map[? ROCKET_MAP.STARTUP];
			break;
		case WEAPON.SHRUKEN:
		
			break;
	}