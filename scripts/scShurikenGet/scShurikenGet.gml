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
	case SHURIKEN.ICE:
		map[? SHURIKEN_MAP.NAME] = "Frost Star";
		map[? SHURIKEN_MAP.DESCRIPTION] = "Cold to the touch";
		map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.ICE;
		map[? SHURIKEN_MAP.COOLDOWN] = 45;
		map[? SHURIKEN_MAP.PARTICLE] = oParticleHandler.ds_part[?PARTICLES.FROST];
		map[? SHURIKEN_MAP.SPEED] = 23;
		map[? SHURIKEN_MAP.DAMAGE] = 1;
		map[? SHURIKEN_MAP.BUFF] = [BUFFTYPE.FROZEN];
		map[? SHURIKEN_MAP.ULTIMATE] = ULTIMATE.ICE_SWORD;
		map[? SHURIKEN_MAP.DESPAWN_SCRIPT] = scShuriken_Ice_Despawn;
		map[? SHURIKEN_MAP.WALL_SCRIPT] = scShuriken_Ice_Despawn;
		map[? SHURIKEN_MAP.DEATHCAUSE] = DEATH_LIST.FROZEN;
		break;
}

return map;