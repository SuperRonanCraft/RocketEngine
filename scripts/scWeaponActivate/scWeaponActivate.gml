//Shoot a weapon
/// @desc checks the cooldown, if so, start the next cooldown
///@arg weapon-map
///@arg override-cooldown*

var _map = argument[0];
var _override = argument_count > 1 ? argument[1] : false;

if ((_map[? WEAPON_MAP.ENABLED] && _map[? WEAPON_MAP.RELOAD_TIME] <= 0 && _map[? WEAPON_MAP.COOLDOWN_TIME] == 0) || _override)
	switch (_map[? WEAPON_MAP.TYPE]) {
		case WEAPON_TYPE.ROCKET:
			var rocket_map = _map[? WEAPON_MAP.MAP];
			_map[? WEAPON_MAP.COOLDOWN_TIME] = rocket_map[? ROCKET_MAP.COOLDOWN];
			_map[? WEAPON_MAP.DELAY_TIME] = rocket_map[? ROCKET_MAP.STARTUP];
			break;
		case WEAPON_TYPE.SHURIKEN:
			var shuriken_map = _map[? WEAPON_MAP.MAP];
			_map[? WEAPON_MAP.COOLDOWN_TIME] = shuriken_map[? SHURIKEN_MAP.COOLDOWN];
			_map[? WEAPON_MAP.DELAY_TIME] = shuriken_map[? SHURIKEN_MAP.STARTUP];
			break;
		case WEAPON_TYPE.ARROW:
			var arrow_map = _map[? WEAPON_MAP.MAP];
			_map[? WEAPON_MAP.COOLDOWN_TIME] = arrow_map[? ARROW_MAP.COOLDOWN];
			_map[? WEAPON_MAP.DELAY_TIME] = arrow_map[? ARROW_MAP.STARTUP];
			//_map[? WEAPON_MAP.START_DELAY] = true;
			break;			
	}