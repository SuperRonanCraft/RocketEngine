/// @desc Load all arrow and set the default one
///	@arg arrow
function scArrowGet(argument0) {

	//var varcd = TIME_SPEED;

	var map = scArrowDefaults();
	var wep = argument0;

	//DEFAULTS
	map[? ARROW_MAP.TYPE] = wep;
	map[? ARROW_MAP.NAME] = "Normal Arrow";
	map[? ARROW_MAP.DESCRIPTION] = "As basic as they come.";
	map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.DEFAULT;
	map[? ARROW_MAP.COOLDOWN] = 40;
	map[? ARROW_MAP.SPEED] = 10;
	map[? ARROW_MAP.POWER] = 500;
	map[? ARROW_MAP.POWER_MAX] = 300; 
	map[? ARROW_MAP.KBAMT] = 5;
	map[? ARROW_MAP.WEIGHT] = 8;
	map[? ARROW_MAP.DAMAGE] = 8;

	//Custom Values
	switch (wep) {
	    case WEAPON_ARROW_TYPE.NONE:
	        map[? ARROW_MAP.DAMAGE] = 0;
			//map[? ARROW_MAP.ULTIMATE] = ULTIMATE.NONE;
	        break;
	    case WEAPON_ARROW_TYPE.DEFAULT:
			/*map[? ARROW_MAP.NAME] = "Normal Arrow";
			map[? ARROW_MAP.DESCRIPTION] = "As basic as they come.";
			map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.DEFAULT;
			map[? ARROW_MAP.COOLDOWN] = 40;
			map[? ARROW_MAP.SPEED] = 10;
			map[? ARROW_MAP.POWER] = 500;
			map[? ARROW_MAP.POWER_MAX] = 300; 
			map[? ARROW_MAP.KBAMT] = 5;
			map[? ARROW_MAP.WEIGHT] = 8;
			map[? ARROW_MAP.DAMAGE] = 2;*/
			break;
	}

	return map;


}
