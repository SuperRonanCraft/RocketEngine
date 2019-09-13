//Damage combos (multipliers)

combo_map = ds_map_create();
var map = combo_map;
map[? COMBO_MAP.ENTITY] = noone;
map[? COMBO_MAP.TEXT_LIST] = ["GREAT!", "WONDERFUL", "AMAZING!", "KILLING SPREE!"];
map[? COMBO_MAP.TEXT] = noone;
map[? COMBO_MAP.SCALE] = 1;
map[? COMBO_MAP.SCALE_MAX] = 3;
map[? COMBO_MAP.STREAK] = 0;
map[? COMBO_MAP.STREAK_HIGHEST] = 0;
map[? COMBO_MAP.COOLDOWN] = 0;
map[? COMBO_MAP.COOLDOWN_MAX] = 20;
//combo_amount = 0; //If were in a combo
//combo_player = noone;
//combo_text = ["GREAT!", "WONDERFUL", "AMAZING!", "KILLING SPREE!"];
//combo_text_current = combo_text[0];
//combo_scale = 1; //Scale of combo
//combo_cooldown = 50; //Cool down on the combo is step amount
//combo_cooldown_current = 0; //Internal timer

enum COMBO_MAP {
	ENTITY, //Entity we are combo-ing with
	TEXT_LIST, //List of text
	TEXT, //Current text to display
	SCALE, //scale to show
	SCALE_MAX,
	COOLDOWN, //cooldown when the player can get out of a combo
	COOLDOWN_MAX,
	STREAK, //curent combo streak
	STREAK_HIGHEST
}

enum COMBO_TYPE { //Set in a weapon map
	KNOCKBACK, NO_MISS
}