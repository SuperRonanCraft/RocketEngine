/// @desc check if we're in a knockback state, add to the combo modifier
/// @arg combo-instance
var p = argument0;
if (p.object_index != oPlayer) exit;
var type = p.weapon_map[? WEAPON_MAP.COMBO_TYPE];
var count_up = false;
switch (type) {
	case COMBO_TYPE.KNOCKBACK:
		//if (player_map[? PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.KNOCKBACK)
			count_up = true;
		break;
	case COMBO_TYPE.NO_MISS: count_up = true; break;
}

if (count_up)
	with (p) {
		var map = combo_map;
		//combo_amount++;
		map[? COMBO_MAP.STREAK]++;
		map[? COMBO_MAP.STREAK_LAST] = map[? COMBO_MAP.STREAK];
		//combo_cooldown_current = 0;
		map[? COMBO_MAP.COOLDOWN] = p.weapon_map[? WEAPON_MAP.COMBO_COOLDOWN];
		//combo_player = other.id;
		map[? COMBO_MAP.ENTITY] = other.id;
		//combo_text_current = combo_text[irandom_range(0, array_length_1d(combo_text) - 1)];
		var combo_text = map[? COMBO_MAP.TEXT_LIST];
		map[? COMBO_MAP.TEXT] = combo_text[irandom_range(0, array_length_1d(combo_text) - 1)];
		//combo_scale = clamp(combo_scale + 1, 1, 4);
		map[? COMBO_MAP.SCALE] = clamp(map[? COMBO_MAP.SCALE] + 1, 1, map[? COMBO_MAP.SCALE_MAX]);
		if (map[? COMBO_MAP.STREAK] > map[? COMBO_MAP.STREAK_HIGHEST]) { //Combo highest in this game
			map[? COMBO_MAP.STREAK_HIGHEST] = map[? COMBO_MAP.STREAK];
			scAchievements_CustomEvent(ACHIEVEMENTS.COMBO, map[? COMBO_MAP.STREAK]);
		}
		map[? COMBO_MAP.POS_X] = x;
		map[? COMBO_MAP.POS_Y] = bbox_top - 10;
		map[? COMBO_MAP.ALPHA] = 1 * min(5, max(1, map[? COMBO_MAP.STREAK_LAST]));
	}