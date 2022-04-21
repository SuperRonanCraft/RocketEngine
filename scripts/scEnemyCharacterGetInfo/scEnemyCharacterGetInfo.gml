///@desc get a characters info (Delete after grabbing)
///@arg character
function scEnemyCharacterGetInfo(argument0) {

	var map = ds_map_create();
	map[? CHARACTER_MAP.TYPE] = argument0;
	//map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET; //Default weapon
	map[? CHARACTER_MAP.HEALTH_BASE] = 20; //Default health
	map[? CHARACTER_MAP.HEALTH_ARMOR] = 0; //Default health
	map[? CHARACTER_MAP.HEALTH_SHIELD] = 0; //Default health
	map[? CHARACTER_MAP.NAME] = "Bob"; //Default name
	map[? CHARACTER_MAP.PALETTE] = noone;
	map[? CHARACTER_MAP.PALETTE_INDEX] = 0;
	map[? CHARACTER_MAP.CAN_PICK] = true;
	map[? CHARACTER_MAP.ULTIMATE] = noone;
	map[? CHARACTER_MAP.ABILITY] = noone;
	map[? CHARACTER_MAP.SPEED] = 8;

	switch (map[? CHARACTER_MAP.TYPE]) {
		case CHARACTER_ENEMY.ENEMY:
			map[? CHARACTER_MAP.NAME] = "Enemy";
			//map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET; 
			map[? CHARACTER_MAP.HEALTH_BASE] = 10;
			map[? CHARACTER_MAP.HEALTH_ARMOR] = 10;
			map[? CHARACTER_MAP.HEALTH_SHIELD] = 20;
			map[? CHARACTER_MAP.PALETTE] = sPallete_default;
			map[? CHARACTER_MAP.SPEED] = 1;
			break;
		case CHARACTER_ENEMY.ZOMBIE:
			map[? CHARACTER_MAP.NAME] = "Zombie";
			//map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET; 
			map[? CHARACTER_MAP.HEALTH_BASE] = 30;
			map[? CHARACTER_MAP.SPEED] = 7;
			map[? CHARACTER_MAP.PALETTE] = sPallete_zombie;
			map[? CHARACTER_MAP.SOUND_DIE] = snZombie_Die;
			break;
	}

	return map;


}
