var map = combo_map;
if (map[? COMBO_MAP.STREAK] > 0 && map[? COMBO_MAP.ENTITY] != noone)
	with (map[? COMBO_MAP.ENTITY])
		if ((player_tech && player_map[? PLAYER_MAP.PLAYER_STATE] != PLAYERSTATE.KNOCKBACK) || standing) {
			if (map[? COMBO_MAP.COOLDOWN] <= 0)
				map[? COMBO_MAP.STREAK] = 0;
			else
				map[? COMBO_MAP.COOLDOWN]--;
		}