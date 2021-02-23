/// @desc check if we've missed, remove the combo modifier
function scComboMiss() {
	if (!system_combo) exit;
	var type = weapon_map[? WEAPON_MAP.COMBO_TYPE];
	var count_down = false;
	switch (type) {
		case COMBO_TYPE.KNOCKBACK: count_down = false; break;
		case COMBO_TYPE.NO_MISS: count_down = true; break;
	}

	if (count_down) {
		var map = combo_map; //cancel the combo
		map[? COMBO_MAP.COOLDOWN] = 0
		map[? COMBO_MAP.STREAK] = 0;
	}


}
