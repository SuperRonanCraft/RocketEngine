var map = combo_map;
var count_down = false;
var type = weapon_map[? WEAPON_MAP.COMBO_TYPE];
switch (type) {
	case COMBO_TYPE.KNOCKBACK:
		if (map[? COMBO_MAP.STREAK] > 0 && map[? COMBO_MAP.ENTITY] != noone)
			with (map[? COMBO_MAP.ENTITY])
				if ((player_tech && player_map[? PLAYER_MAP.PLAYER_STATE] != PLAYERSTATE.KNOCKBACK) || standing)
					count_down = true;
		break;
	case COMBO_TYPE.NO_MISS: count_down = true; break; //Let the miss event handle this
}

if (count_down) {
	if (map[? COMBO_MAP.COOLDOWN] <= 0)
		map[? COMBO_MAP.STREAK] = 0;
	else
		map[? COMBO_MAP.COOLDOWN]--;
}

if (map[? COMBO_MAP.STREAK] > 1) {
	if (map[? COMBO_MAP.DIALATED] < map[? COMBO_MAP.DIALATED_MAX]) {
		map[? COMBO_MAP.DIALATED]++;
		with (oPlayer)
			time_dialation = 0;
	}
}