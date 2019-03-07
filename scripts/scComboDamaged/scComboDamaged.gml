/// @desc check if we're in a knockback state, add to the combo modifier
/// @arg shooter-instance
if (playerMap[? PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.KNOCKBACK)
	with (argument0) {
		if (object_index != oPlayer) exit;
		combo_amount++;
		combo_cooldown_current = 0;
		combo_player = other.id;
		combo_text_current = combo_text[irandom_range(0, array_length_1d(combo_text) - 1)];
		combo_scale = clamp(combo_scale + 1, 1, 4);
	}