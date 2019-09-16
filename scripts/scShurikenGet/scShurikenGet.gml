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
		map[? SHURIKEN_MAP.NAME] = "Silver Star";
		map[? SHURIKEN_MAP.DESCRIPTION] = "A familiar weapon";
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
		
	case SHURIKEN.FIRE:
		map[? SHURIKEN_MAP.NAME] = "Flame's Ember";
		map[? SHURIKEN_MAP.DESCRIPTION] = "A stinging flame";
		map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.FIRE;
		map[? SHURIKEN_MAP.PARTICLE] = oParticleHandler.ds_part[?PARTICLES.EMBER];
		map[? SHURIKEN_MAP.COOLDOWN] = 42;
		map[? SHURIKEN_MAP.SPEED] = 20;
		map[? SHURIKEN_MAP.DAMAGE] = 2;
		map[? SHURIKEN_MAP.ULTIMATE] = ULTIMATE.FIRE_SWORD;
		map[? SHURIKEN_MAP.DEATHCAUSE] = DEATH_LIST.LASER;
		map[? SHURIKEN_MAP.DESPAWN_SCRIPT] = scShuriken_Fire_Despawn;
		map[? SHURIKEN_MAP.WALL_SCRIPT] = scShuriken_Fire_Despawn;
		
		break;
		
	case SHURIKEN.PORTAL:
		map[? SHURIKEN_MAP.NAME] = "Gravity's Core";
		map[? SHURIKEN_MAP.DESCRIPTION] = "A perplexing puzzle";
		map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.PORTAL;
		map[? SHURIKEN_MAP.PARTICLE] = oParticleHandler.ds_part[?PARTICLES.MAGNET];
		map[? SHURIKEN_MAP.COOLDOWN] = 20;
		map[? SHURIKEN_MAP.SPEED] = 22;
		map[? SHURIKEN_MAP.DAMAGE] = 2;
		map[? SHURIKEN_MAP.ULTIMATE] = ULTIMATE.DEFAULT_SWORD;
		map[? SHURIKEN_MAP.CLIP] = 2;
		map[? SHURIKEN_MAP.RELOAD_TIME] = 80;
		map[? SHURIKEN_MAP.TIMER] = 45;
		map[? SHURIKEN_MAP.STICK] = false;
		map[? SHURIKEN_MAP.WALL_SCRIPT] = scShuriken_Portal_Wall;
		map[? SHURIKEN_MAP.DESPAWN_SCRIPT] = scShuriken_Portal_Despawn;
		map[? SHURIKEN_MAP.PLAYER_SCRIPT] = scShuriken_Portal_Despawn;
		map[? SHURIKEN_MAP.WEAPON_SCRIPT] = scShuriken_Portal_Weapon;
		
		break;
}

return map;