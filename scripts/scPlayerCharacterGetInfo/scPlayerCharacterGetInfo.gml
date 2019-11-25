///@desc get a characters info (Delete after grabbing)
///@arg character

var map = ds_map_create();
map[? CHARACTER_MAP.TYPE] = argument0;
map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET; //Default weapon
map[? CHARACTER_MAP.HEALTH] = 20; //Default health
map[? CHARACTER_MAP.NAME] = "Bob"; //Default name
map[? CHARACTER_MAP.PALETTE] = noone;
map[? CHARACTER_MAP.PALETTE_INDEX] = 0;
map[? CHARACTER_MAP.CAN_PICK] = true;
map[? CHARACTER_MAP.ULTIMATE] = noone;
map[? CHARACTER_MAP.ABILITY] = noone;

switch (map[? CHARACTER_MAP.TYPE]) {
	case CHARACTER.DEFAULT:
		map[? CHARACTER_MAP.NAME] = "Steve";
		map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET;
		map[? CHARACTER_MAP.HEALTH] = 70;
		map[? CHARACTER_MAP.PALETTE] = sPallete_default;
		map[? CHARACTER_MAP.ULTIMATE] = ULTIMATE_TYPE.HOMING;
		break;
	case CHARACTER.SWORD:
		map[? CHARACTER_MAP.NAME] = "Sword Guy";
		map[? CHARACTER_MAP.WEAPON] = WEAPON.SHURIKEN;
		map[? CHARACTER_MAP.HEALTH] = 50;
		map[? CHARACTER_MAP.PALETTE] = sPallete_sword;
		map[? CHARACTER_MAP.ULTIMATE] = ULTIMATE_TYPE.ICE_SWORD;
		break;
	case CHARACTER.ARROW:
		map[? CHARACTER_MAP.NAME] = "Hush";
		map[? CHARACTER_MAP.WEAPON] = WEAPON.ARROW;
		map[? CHARACTER_MAP.HEALTH] = 30;
		map[? CHARACTER_MAP.PALETTE] = sPallete_default;
		map[? CHARACTER_MAP.ULTIMATE] = ULTIMATE_TYPE.TRAP
		break;
}

return map;