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
		map[? SHURIKEN_MAP.ULTIMATE] = ULTIMATE.PORTAL_SWORD;
		
		break;
    case SHURIKEN.BRICK:
		map[? SHURIKEN_MAP.NAME] = "A Brick";
		map[? SHURIKEN_MAP.DESCRIPTION] = "It's a brick";
		map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.BRICK;
		map[? SHURIKEN_MAP.COOLDOWN] = 50;
		map[? SHURIKEN_MAP.SPEED] = 12;
		map[? SHURIKEN_MAP.DAMAGE] = 3;
		map[? SHURIKEN_MAP.PLAYER_SCRIPT] = scShuriken_Brick_Player;
		map[? SHURIKEN_MAP.STICK] = false;
		map[? SHURIKEN_MAP.KBAMT] = 7;
		map[? SHURIKEN_MAP.ROTATE] = false;
		map[? SHURIKEN_MAP.WEAPON_SCRIPT] = scShuriken_Brick_Weapon;
		break;
		
    case SHURIKEN.MAGNET:
		map[? SHURIKEN_MAP.NAME] = "Magnetic Mark";
		map[? SHURIKEN_MAP.DESCRIPTION] = "With polarized points";
		map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.MAGNET;
		map[? SHURIKEN_MAP.COOLDOWN] = 30;
		map[? SHURIKEN_MAP.SPEED] = 30;
		map[? SHURIKEN_MAP.CLIP] = 3;
		map[? SHURIKEN_MAP.DAMAGE] = 1;
		map[? SHURIKEN_MAP.RELOAD_TIME] = 80;
		break;
		
    case SHURIKEN.SAND:
		map[? SHURIKEN_MAP.NAME] = "Scarab Scythe";
		map[? SHURIKEN_MAP.DESCRIPTION] = "In shrouded clouds";
		map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.SAND;
		map[? SHURIKEN_MAP.COOLDOWN] = 25;
		map[? SHURIKEN_MAP.SPEED] = 10;
		map[? SHURIKEN_MAP.CLIP] = 5;
		map[? SHURIKEN_MAP.DAMAGE] = 2;
		map[? SHURIKEN_MAP.RELOAD_TIME] = 90;
		map[? SHURIKEN_MAP.ULTIMATE] = ULTIMATE.SAND_SWORD;
		break;
	
    case SHURIKEN.SHOTGUN:
		map[? SHURIKEN_MAP.NAME] = "Tri Kunai";
		map[? SHURIKEN_MAP.DESCRIPTION] = "Three strikes";
		map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.SHOTGUN;
		map[? SHURIKEN_MAP.COOLDOWN] = 50;
		map[? SHURIKEN_MAP.SPEED] = 20;
		map[? SHURIKEN_MAP.DAMAGE] = 1;
		map[? SHURIKEN_MAP.ROTATE] = false;
		map[? SHURIKEN_MAP.SPAWN_SCRIPT] = scShuriken_Shotgun_Spawn;
		break;
		
    case SHURIKEN.SLIME:
		map[? SHURIKEN_MAP.NAME] = "Experimental entity";
		map[? SHURIKEN_MAP.DESCRIPTION] = "Use at your own risk";
		map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.SLIME;
		map[? SHURIKEN_MAP.COOLDOWN] = 28;
		map[? SHURIKEN_MAP.SPEED] = 25;
		map[? SHURIKEN_MAP.CLIP] = 3;
		map[? SHURIKEN_MAP.DAMAGE] = 1;
		map[? SHURIKEN_MAP.RELOAD_TIME] = 40;
		break;
		
	case SHURIKEN.METAL:
		map[? SHURIKEN_MAP.NAME] = "The Razor";
		map[? SHURIKEN_MAP.DESCRIPTION] = "Crude and effective";		
		map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.METAL;
		map[? SHURIKEN_MAP.SPEED] = 25;
		map[? SHURIKEN_MAP.KBAMT] = 0;
		map[? SHURIKEN_MAP.COOLDOWN] = 25;
		map[? SHURIKEN_MAP.BUFF] = [BUFFTYPE.BLEEDOUT];
		break;
		
	case SHURIKEN.ELECTRIC:
		map[? SHURIKEN_MAP.NAME] = "Sparkling Star";
		map[? SHURIKEN_MAP.DESCRIPTION] = "A mild buzz";		
		map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.ELECTRIC;
		map[? SHURIKEN_MAP.SPEED] = 30;
		map[? SHURIKEN_MAP.KBAMT] = 0;
		map[? SHURIKEN_MAP.CLIP] = 2;
		map[? SHURIKEN_MAP.RELOAD_TIME] = 45;
		map[? SHURIKEN_MAP.COOLDOWN] = 25;
		map[? SHURIKEN_MAP.PARTICLE] = oParticleHandler.ds_part[?PARTICLES.SCRAPING];
		map[? SHURIKEN_MAP.ULTIMATE] = ULTIMATE.LIGHTNING_SWORD;
		break;
}

return map;