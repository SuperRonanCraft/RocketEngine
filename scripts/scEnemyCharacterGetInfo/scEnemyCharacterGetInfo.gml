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
	case CHARACTER_ENEMY.ENEMY:
		map[? CHARACTER_MAP.NAME] = "Enemy";
		map[? CHARACTER_MAP.WEAPON] = WEAPON.SHURIKEN; 
		map[? CHARACTER_MAP.HEALTH] = 30;
		map[? CHARACTER_MAP.PALETTE] = sPallete_default;
		break;
	case CHARACTER_ENEMY.NADES:
		map[? CHARACTER_MAP.NAME] = "Grenade";
		map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET; 
		map[? CHARACTER_MAP.HEALTH] = 30;
		map[? CHARACTER_MAP.PALETTE] = sPallete_default;
		break;
}

return map;