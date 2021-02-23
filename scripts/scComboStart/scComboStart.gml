function scComboStart() {
	//Damage combos (multipliers)

	combo_map = ds_map_create();
	var map = combo_map;
	map[? COMBO_MAP.ENTITY] = noone;
	map[? COMBO_MAP.TEXT_LIST] = ["GREAT!", "WONDERFUL", "AMAZING!", "KILLING SPREE!"];
	map[? COMBO_MAP.TEXT] = noone;
	map[? COMBO_MAP.SCALE] = 1;
	map[? COMBO_MAP.SCALE_MAX] = 3;
	map[? COMBO_MAP.STREAK] = 0;
	map[? COMBO_MAP.STREAK_LAST] = 0;
	map[? COMBO_MAP.STREAK_HIGHEST] = 0;
	map[? COMBO_MAP.COOLDOWN] = 0;
	map[? COMBO_MAP.POS_X] = 0;
	map[? COMBO_MAP.POS_Y] = 0;
	map[? COMBO_MAP.ALPHA] = 0;
	map[? COMBO_MAP.DIALATED] = 0; //Current dialation
	map[? COMBO_MAP.DIALATED_MAX] = 4; //Max dialating amount

	enum COMBO_MAP {
		ENTITY, //Entity we are combo-ing with
		TEXT_LIST, //List of text
		TEXT, //Current text to display
		SCALE, //scale to show
		SCALE_MAX,
		COOLDOWN, //cooldown when the player can get out of a combo
		STREAK, //curent combo streak
		STREAK_LAST,
		STREAK_HIGHEST,
		POS_X,
		POS_Y,
		ALPHA,
		DIALATED,
		DIALATED_MAX
	}

	enum COMBO_TYPE { //Set in a weapon map
		KNOCKBACK, NO_MISS
	}


}
