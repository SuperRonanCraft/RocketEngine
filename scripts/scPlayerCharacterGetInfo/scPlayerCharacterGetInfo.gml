///@desc get a characters info (Delete after grabbing)
///@arg character
function scPlayerCharacterGetInfo(argument0) {

	var map = ds_map_create();
	map[? CHARACTER_MAP.TYPE] = argument0;
	//map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET; //Default weapon
	map[? CHARACTER_MAP.HEALTH_BASE] = 20; //Default health
	map[? CHARACTER_MAP.HEALTH_ARMOR] = 0; //Default armor
	map[? CHARACTER_MAP.HEALTH_SHIELD] = 0; //Default shield
	map[? CHARACTER_MAP.NAME] = "Bob"; //Default name
	map[? CHARACTER_MAP.PALETTE] = noone;
	map[? CHARACTER_MAP.PALETTE_INDEX] = 0;
	map[? CHARACTER_MAP.CAN_PICK] = true;
	map[? CHARACTER_MAP.ULTIMATE] = noone;
	map[? CHARACTER_MAP.ABILITY] = ABILITY_TYPE.NONE;
	map[? CHARACTER_MAP.WEAPON] = WEAPON_TYPE.NONE;

	switch (map[? CHARACTER_MAP.TYPE]) {
		case CHARACTER.DEFAULT:
			map[? CHARACTER_MAP.NAME] = "Steve";
			map[? CHARACTER_MAP.WEAPON] = WEAPON_TYPE.ROCKET;
			map[? CHARACTER_MAP.HEALTH_BASE] = 50;
			map[? CHARACTER_MAP.HEALTH_ARMOR] = 20;
			map[? CHARACTER_MAP.PALETTE] = sPallete_default;
			map[? CHARACTER_MAP.ULTIMATE] = ULTIMATE_TYPE.HOMING;
			map[? CHARACTER_MAP.ABILITY] = ABILITY_TYPE.BLOCK;
			break;
		case CHARACTER.SWORD:
			map[? CHARACTER_MAP.NAME] = "Sword Guy";
			map[? CHARACTER_MAP.WEAPON] = WEAPON_TYPE.SHURIKEN;
			map[? CHARACTER_MAP.HEALTH_BASE] = 30;
			map[? CHARACTER_MAP.HEALTH_SHIELD] = 20;
			map[? CHARACTER_MAP.PALETTE] = sPallete_sword;
			map[? CHARACTER_MAP.ULTIMATE] = ULTIMATE_TYPE.ICE_SWORD;
			map[? CHARACTER_MAP.ABILITY] = ABILITY_TYPE.SMOKE_CLOUD;
			break;
		case CHARACTER.ARROW:
			map[? CHARACTER_MAP.NAME] = "Hush";
			map[? CHARACTER_MAP.WEAPON] = WEAPON_TYPE.ARROW;
			map[? CHARACTER_MAP.HEALTH_BASE] = 100;
			map[? CHARACTER_MAP.HEALTH_ARMOR] = 50;
			map[? CHARACTER_MAP.HEALTH_SHIELD] = 50;
			map[? CHARACTER_MAP.PALETTE] = sPallete_default;
			map[? CHARACTER_MAP.ULTIMATE] = ULTIMATE_TYPE.TRAP;
			map[? CHARACTER_MAP.ABILITY] = ABILITY_TYPE.PORTAL;
			break;
	}

	return map;


}
