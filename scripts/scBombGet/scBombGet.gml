/// @desc Load all bombs and set the default one
///	@arg BOMB
function scBombGet(argument0) {

	//var varcd = TIME_SPEED;

	var map = scBombDefaults();
	var shur = argument0;

	map[? BOMB_MAP.TYPE] = shur;

	switch (shur) {
	    case WEAPON_BOMB_TYPE.NONE:
	        map[? BOMB_MAP.DAMAGE] = 0;
			//map[? BOMB_MAP.ULTIMATE] = ULTIMATE.NONE;
	        break;
	    case WEAPON_BOMB_TYPE.FIRE:
			map[? BOMB_MAP.NAME] = "Fire Bomb";
			map[? BOMB_MAP.DESCRIPTION] = "I put fire in a bomb.";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.FIRE;
			map[? BOMB_MAP.COOLDOWN] = 50;
			map[? BOMB_MAP.SPEED] = 20;
			map[? BOMB_MAP.TIMER] = 250;
			map[? BOMB_MAP.WEIGHT] = 16;
			map[? BOMB_MAP.TIMER_ACCEL] = 0.2;
			map[? BOMB_MAP.DAMAGE] = 8;
			map[? BOMB_MAP.BUFF] = [BUFFTYPE.BURNING];
			map[? BOMB_MAP.BOUNCE] = 0.99;
			map[? BOMB_MAP.FRICTION] = 0.1;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.EMBER;
			map[? BOMB_MAP.DAMAGE_ELEMENT] = DAMAGE_ELEMENT.FIRE;
			map[? BOMB_MAP.DAMAGE_TYPE] = DAMAGE_TYPE.NONE;
			break;
		case WEAPON_BOMB_TYPE.ICE:
			map[? BOMB_MAP.NAME] = "Ice Bomb";
			map[? BOMB_MAP.DESCRIPTION] = "I put ice in a bomb.";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.ICE;
			map[? BOMB_MAP.COOLDOWN] = 40;
			map[? BOMB_MAP.SPEED] = 15;
			map[? BOMB_MAP.TIMER] = 300;
			map[? BOMB_MAP.TIMER_ACCEL] = 0.2;
			map[? BOMB_MAP.DAMAGE] = 7;
			map[? BOMB_MAP.BUFF] = [BUFFTYPE.CHILLED];
			map[? BOMB_MAP.FRICTION] = 0.99;
			map[? BOMB_MAP.BOUNCE] = 0.2;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.FROST;
			map[? BOMB_MAP.DAMAGE_ELEMENT] = DAMAGE_ELEMENT.COLD;
			map[? BOMB_MAP.DAMAGE_TYPE] = DAMAGE_TYPE.NONE;
			map[? BOMB_MAP.DEATHCAUSE] = DEATH_LIST.FROZEN;
			break;
			
		case WEAPON_BOMB_TYPE.SLIME:
			map[? BOMB_MAP.NAME] = "Slime Bomb";
			map[? BOMB_MAP.DESCRIPTION] = "I put slime in a bomb.";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.SLIME;
			map[? BOMB_MAP.COOLDOWN] = 60;
			map[? BOMB_MAP.SPEED] = 9;
			map[? BOMB_MAP.TIMER] = 300;
			map[? BOMB_MAP.PARTICLE_WALL] = oParticleHandler.ds_part[? PARTICLES.SLIME];
			map[? BOMB_MAP.DAMAGE_ELEMENT] = DAMAGE_ELEMENT.SLIME;
			map[? BOMB_MAP.DAMAGE_TYPE] = DAMAGE_TYPE.NONE;
			map[? BOMB_MAP.DAMAGE] = 11;
			map[? BOMB_MAP.FRICTION] = 0.9;
			map[? BOMB_MAP.TIMER_ACCEL] = 0.3;
			map[? BOMB_MAP.BOUNCE] = 0.9;
			map[? BOMB_MAP.BUFF] = [BUFFTYPE.SLIME];
			map[? BOMB_MAP.PARTICLE] = PARTICLES.SLIME;
			break;
			
		case WEAPON_BOMB_TYPE.ELECTRIC:
			map[? BOMB_MAP.NAME] = "Shock Bomb";
			map[? BOMB_MAP.DESCRIPTION] = "I put electricity in a bomb.";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.ELECTRIC;
			map[? BOMB_MAP.COOLDOWN] = 70;
			map[? BOMB_MAP.SPEED] = 9;
			map[? BOMB_MAP.DAMAGE] = 9;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.LIGHTNING;
			break;
			
		case WEAPON_BOMB_TYPE.BRICK:
			map[? BOMB_MAP.NAME] = "Brick Bomb";
			map[? BOMB_MAP.DESCRIPTION] = "Through careful and intricate application of knowledge and expertise in my craft, I singlehandedly managed to make this brick explode.";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.BRICK;
			map[? BOMB_MAP.WALL_SCRIPT] = scBomb_Brick_WallScript;
			map[? BOMB_MAP.COOLDOWN] = 60;
			map[? BOMB_MAP.SPEED] = 20;
			map[? BOMB_MAP.WEIGHT] = 10;
			map[? BOMB_MAP.TIMER] = 500;
			map[? BOMB_MAP.EXPLOSION_SCALE] = 0.5;
			map[? BOMB_MAP.FRICTION] = 0.1;
			map[? BOMB_MAP.BOUNCE] = 0.3;
			map[? BOMB_MAP.DAMAGE] = 15;
			map[? BOMB_MAP.RICOCHET] = true;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.SLOWMO;
			break;
		
		case WEAPON_BOMB_TYPE.METAL:
			map[? BOMB_MAP.NAME] = "Spike Bomb";
			map[? BOMB_MAP.DESCRIPTION] = "I put spikes on a bomb.";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.METAL;
			map[? BOMB_MAP.COOLDOWN] = 30;
			map[? BOMB_MAP.TIMER] = 300;
			map[? BOMB_MAP.SPEED] = 15;
			map[? BOMB_MAP.TIMER_ACCEL] = 1;
			map[? BOMB_MAP.DAMAGE] = 5;
			map[? BOMB_MAP.HIT_SCRIPT] = scBomb_Metal_HitScript;
			map[? BOMB_MAP.STICK] = true;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.SPARKLE;
			map[? BOMB_MAP.DAMAGE_TYPE] = DAMAGE_TYPE.STAB;
			map[? BOMB_MAP.PARTICLE_SPLASH_COLOR] = c_white;
			break;
		
		case WEAPON_BOMB_TYPE.SHOTGUN:
			map[? BOMB_MAP.NAME] = "Cluster Bomb";
			map[? BOMB_MAP.DESCRIPTION] = "I put bombs in a bomb.";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.SHOTGUN;
			map[? BOMB_MAP.COOLDOWN] = 30;
			map[? BOMB_MAP.TIMER] = 100;
			map[? BOMB_MAP.EXPLOSION_SCALE] = 1;
			map[? BOMB_MAP.SPEED] = 13;
			map[? BOMB_MAP.DAMAGE] = 4;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.SAND;
			map[? BOMB_MAP.DESPAWN_SCRIPT] = scBomb_Shotgun_Despawn;
			break;

		case WEAPON_BOMB_TYPE.PORTAL:
			map[? BOMB_MAP.NAME] = "Portal Bomb";
			map[? BOMB_MAP.DESCRIPTION] = "I put a bomb in an explosion.";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.PORTAL;
			map[? BOMB_MAP.COOLDOWN] = 60;
			map[? BOMB_MAP.SPEED] = 10;
			map[? BOMB_MAP.DAMAGE] = 9;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.MAGNET;
			map[? BOMB_MAP.PARTICLE_SPLASH_COLOR] = c_fuchsia;
			break;

	    case WEAPON_BOMB_TYPE.DEFAULT:
		default:
			map[? BOMB_MAP.NAME] = "Bomb";
			map[? BOMB_MAP.DESCRIPTION] = "My favorite.";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.DEFAULT;
			map[? BOMB_MAP.COOLDOWN] = 40;
			map[? BOMB_MAP.TIMER] = 250;
			map[? BOMB_MAP.SPEED] = 15;
			map[? BOMB_MAP.DAMAGE] = 12;
			break;
	}

	return map;


}
