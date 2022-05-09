/// @desc Load all bullet and set the default one
///	@arg bullet
function scBulletGet(argument0) {

	//var varcd = TIME_SPEED;

	var map = scBulletDefaults();
	var wep = argument0;

	//DEFAULTS
	map[? BULLET_MAP.TYPE] = wep;
	map[? BULLET_MAP.NAME] = "Normal Bullet";
	map[? BULLET_MAP.DESCRIPTION] = "As basic as they come.";
	map[? BULLET_MAP.PROJECTILE] = BULLET_SPRITE.DEFAULT;
	map[? BULLET_MAP.COOLDOWN] = 40;
	map[? BULLET_MAP.SPEED] = 96;
	map[? BULLET_MAP.POWER] = 500;
	map[? BULLET_MAP.POWER_MAX] = 300; 
	map[? BULLET_MAP.KBAMT] = 5;
	map[? BULLET_MAP.WEIGHT] = 8;
	map[? BULLET_MAP.DAMAGE] = 3;

	//Custom Values
	switch (wep) {
	    case WEAPON_BULLET_TYPE.NONE:
	        map[? BULLET_MAP.DAMAGE] = 0;
			//map[? BULLET_MAP.ULTIMATE] = ULTIMATE.NONE;
	        break;
	    case WEAPON_BULLET_TYPE.DEFAULT:
		default:
			map[? BULLET_MAP.NAME] = "Normal Bullet";
			map[? BULLET_MAP.DESCRIPTION] = "As basic as they come.";
			map[? BULLET_MAP.COOLDOWN] = 20;
			map[? BULLET_MAP.WEIGHT] = 0;
			map[? BULLET_MAP.POWER_MAX] = 300;
			map[? BULLET_MAP.DAMAGE] = 10;
			break;
	}

	return map;


}
