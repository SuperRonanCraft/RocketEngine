/// @desc Load all shurikens and set the default one
///	@arg shuriken

//var varcd = TIME_SPEED;

var map = scArrowDefaults();
var wep = argument0;

map[? ARROW_MAP.TYPE] = wep;

switch (wep) {
    case ARROW.NONE:
        map[? ARROW_MAP.DAMAGE] = 0;
		map[? ARROW_MAP.ULTIMATE] = ULTIMATE.NONE;
        break;
    case ARROW.DEFAULT:
		map[? ARROW_MAP.NAME] = "Normal Arrow";
		map[? ARROW_MAP.DESCRIPTION] = "As basic as they come.";
		map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.DEFAULT;
		map[? ARROW_MAP.COOLDOWN] = 40;
		map[? ARROW_MAP.SPEED] = 10;
		map[? ARROW_MAP.POWER] = 520;
		map[? ARROW_MAP.POWER_MAX] = 300; 
		map[? ARROW_MAP.KBAMT] = 5;
		map[? ARROW_MAP.WEIGHT] = 8;
		map[? ARROW_MAP.DAMAGE] = 2;
		break;
}

return map;