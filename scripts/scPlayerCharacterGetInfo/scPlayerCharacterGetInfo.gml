///@desc get a characters info (Delete after grabbing)
///@arg character-type
var map = ds_map_create();
map[? CHARACTER_MAP.TYPE] = argument0;
map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET; //Default weapon
map[? CHARACTER_MAP.HEALTH] = 20; //Default health
map[? CHARACTER_MAP.NAME] = "Bob"; //Default name
map[? CHARACTER_MAP.PALETTE] = noone;
map[? CHARACTER_MAP.PALETTE_INDEX] = 0;

switch (map[? CHARACTER_MAP.TYPE]) {
	case CHARACTERS.DEFAULT:
		map[? CHARACTER_MAP.NAME] = "Steve";
		map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET;
		map[? CHARACTER_MAP.HEALTH] = 20;
		map[? CHARACTER_MAP.PALETTE] = sPallete_default;
		break;
	case CHARACTERS.SWORD:
		map[? CHARACTER_MAP.NAME] = "Sword Guy";
		map[? CHARACTER_MAP.WEAPON] = WEAPON.SHURIKEN; //CHANGE TO SWORD WHEN DONE!
		map[? CHARACTER_MAP.HEALTH] = 16;
		map[? CHARACTER_MAP.PALETTE] = sPallete_sword;
		break;
}

return map;