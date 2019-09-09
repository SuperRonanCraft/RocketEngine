/// @desc Load all shurikens and set the default one
///	@arg shuriken

//var varcd = TIME_SPEED;

var map = scShurikenDefaults();
var shur = argument0;

map[? SHURIKEN_MAP.TYPE] = shur;

switch (shur) {
    case SHURIKEN.NONE:
        map[? SHURIKEN_MAP.DAMAGE] = 0;
		map[? SHURIKEN_MAP.ULTIMATE] = ULTIMATE.NONE;
        break;
    case SHURIKEN.DEFAULT:
		map[? SHURIKEN_MAP.NAME] = "Standard";
		map[? SHURIKEN_MAP.DESCRIPTION] = "A familiar star";
		map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.DEFAULT;
		map[? SHURIKEN_MAP.COOLDOWN] = 40;
		map[? SHURIKEN_MAP.SPEED] = 20;
		map[? SHURIKEN_MAP.DAMAGE] = 2;
		break;
}

return map;