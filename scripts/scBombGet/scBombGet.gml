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
			map[? BOMB_MAP.NAME] = "Potion of Scorching";
			map[? BOMB_MAP.DESCRIPTION] = "Apply to a meal for a bit of spice";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.FIRE;
			map[? BOMB_MAP.COOLDOWN] = 50;
			map[? BOMB_MAP.SPEED] = 10;
			map[? BOMB_MAP.DAMAGE] = 8;
			map[? BOMB_MAP.BUFF] = [BUFFTYPE.DOUSED];
			map[? BOMB_MAP.PARTICLE] = PARTICLES.EMBER;
			map[? BOMB_MAP.PARTICLE_SPLASH_COLOR] = c_orange;
			break;
		case WEAPON_BOMB_TYPE.ICE:
			map[? BOMB_MAP.NAME] = "Potion of Chill";
			map[? BOMB_MAP.DESCRIPTION] = "Throw at a heated individual to dwell the senses";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.ICE;
			map[? BOMB_MAP.COOLDOWN] = 50;
			map[? BOMB_MAP.SPEED] = 12;
			map[? BOMB_MAP.DAMAGE] = 7;
			map[? BOMB_MAP.BUFF] = [BUFFTYPE.SLOWMO];
			map[? BOMB_MAP.PARTICLE] = PARTICLES.FROST;
			map[? BOMB_MAP.PARTICLE_SPLASH_COLOR] = c_white;
			map[? BOMB_MAP.PARTICLE_AMT] = 5;
			break;
			
		case WEAPON_BOMB_TYPE.SLIME:
			map[? BOMB_MAP.NAME] = "Potion of Gunk";
			map[? BOMB_MAP.DESCRIPTION] = "Apply directly to clean surfaces";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.SLIME;
			map[? BOMB_MAP.COOLDOWN] = 60;
			map[? BOMB_MAP.SPEED] = 9;
			map[? BOMB_MAP.DAMAGE] = 11;
			map[? BOMB_MAP.BUFF] = [BUFFTYPE.SLIME];
			map[? BOMB_MAP.PARTICLE] = PARTICLES.SLIME;
			map[? BOMB_MAP.PARTICLE_SPLASH_COLOR] = c_lime;
			map[? BOMB_MAP.WALL_COLLIDE] = true;
			break;
			
		case WEAPON_BOMB_TYPE.ELECTRIC:
			map[? BOMB_MAP.NAME] = "Potion of Voltage";
			map[? BOMB_MAP.DESCRIPTION] = "Sprinkle and mix with beverage for added electrolytes";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.ELECTRIC;
			map[? BOMB_MAP.COOLDOWN] = 70;
			map[? BOMB_MAP.SPEED] = 9;
			map[? BOMB_MAP.DAMAGE] = 9;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.LIGHTNING;
			map[? BOMB_MAP.PARTICLE_SPLASH_COLOR] = c_yellow;
			map[? BOMB_MAP.WALL_COLLIDE] = true;
			//map[? BOMB_MAP.DELETE_ON_HIT] = false;
			break;
			
		case WEAPON_BOMB_TYPE.BRICK:
			map[? BOMB_MAP.NAME] = "Potion of Brick";
			map[? BOMB_MAP.DESCRIPTION] = "Do not eat";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.BRICK;
			map[? BOMB_MAP.COOLDOWN] = 60;
			map[? BOMB_MAP.SPEED] = 9;
			map[? BOMB_MAP.DAMAGE] = 15;
			map[? BOMB_MAP.DELETE_ON_HIT] = false;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.SLOWMO;
			map[? BOMB_MAP.PARTICLE_SPLASH_COLOR] = c_maroon;
			break;
		
		case WEAPON_BOMB_TYPE.METAL:
			map[? BOMB_MAP.NAME] = "Potion of Shards";
			map[? BOMB_MAP.DESCRIPTION] = "Useful for particularly rough samples";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.METAL;
			map[? BOMB_MAP.COOLDOWN] = 30;
			map[? BOMB_MAP.SPEED] = 10;
			map[? BOMB_MAP.DAMAGE] = 12;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.SPARKLE;
			map[? BOMB_MAP.PARTICLE_SPLASH_COLOR] = c_white;
			map[? BOMB_MAP.WALL_COLLIDE] = true;
			break;
		
		case WEAPON_BOMB_TYPE.SHOTGUN:
			map[? BOMB_MAP.NAME] = "Potion of Plenty";
			map[? BOMB_MAP.DESCRIPTION] = "A duplicating solution that solves nothing";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.SHOTGUN;
			map[? BOMB_MAP.COOLDOWN] = 2;
			map[? BOMB_MAP.CLIP] = 5;
			map[? BOMB_MAP.RELOAD_TIME] = 90;
			map[? BOMB_MAP.SPEED] = 9;
			map[? BOMB_MAP.DAMAGE] = 3;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.SPEED;
			map[? BOMB_MAP.PARTICLE_SPLASH_COLOR] = c_olive;
			break;

		case WEAPON_BOMB_TYPE.PORTAL:
			map[? BOMB_MAP.NAME] = "Potion of Continuity";
			map[? BOMB_MAP.DESCRIPTION] = "An experimental liquid still being studied";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.PORTAL;
			map[? BOMB_MAP.COOLDOWN] = 60;
			map[? BOMB_MAP.SPEED] = 10;
			map[? BOMB_MAP.DAMAGE] = 9;
			map[? BOMB_MAP.PARTICLE] = PARTICLES.MAGNET;
			map[? BOMB_MAP.PARTICLE_SPLASH_COLOR] = c_fuchsia;
			map[? BOMB_MAP.HIT_SCRIPT] = scPotion_Portal_HitScript;
			break;

	    case WEAPON_BOMB_TYPE.DEFAULT:
		default:
			map[? BOMB_MAP.NAME] = "Potion of Ocean";
			map[? BOMB_MAP.DESCRIPTION] = "A dull concoction of no effect";
			map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.DEFAULT;
			map[? BOMB_MAP.COOLDOWN] = 40;
			map[? BOMB_MAP.TIMER] = 250;
			map[? BOMB_MAP.SPEED] = 15;
			map[? BOMB_MAP.DAMAGE] = 12;
			break;
	}

	return map;


}
