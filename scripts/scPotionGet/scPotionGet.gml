/// @desc Load all potions and set the default one
///	@arg POTION
function scPotionGet(argument0) {

	//var varcd = TIME_SPEED;

	var map = scPotionDefaults();
	var shur = argument0;

	map[? POTION_MAP.TYPE] = shur;

	switch (shur) {
	    case WEAPON_POTION_TYPE.NONE:
	        map[? POTION_MAP.DAMAGE] = 0;
			//map[? POTION_MAP.ULTIMATE] = ULTIMATE.NONE;
	        break;
	    case WEAPON_POTION_TYPE.FIRE:
			map[? POTION_MAP.NAME] = "Potion of Scorching";
			map[? POTION_MAP.DESCRIPTION] = "Apply to a meal for a bit of spice";
			map[? POTION_MAP.PROJECTILE] = POTION_SPRITE.FIRE;
			map[? POTION_MAP.COOLDOWN] = 50;
			map[? POTION_MAP.SPEED] = 10;
			map[? POTION_MAP.DAMAGE] = 7;
			map[? POTION_MAP.BUFF] = [BUFFTYPE.BURNRUSH];
			map[? POTION_MAP.PARTICLE] = PARTICLES.EMBER;
			map[? POTION_MAP.PARTICLE_SPLASH_COLOR] = c_orange;
			break;
		case WEAPON_POTION_TYPE.ICE:
			map[? POTION_MAP.NAME] = "Potion of Chill";
			map[? POTION_MAP.DESCRIPTION] = "Throw at a heated individual to dwell the senses";
			map[? POTION_MAP.PROJECTILE] = POTION_SPRITE.ICE;
			map[? POTION_MAP.COOLDOWN] = 50;
			map[? POTION_MAP.SPEED] = 12;
			map[? POTION_MAP.DAMAGE] = 5;
			map[? POTION_MAP.BUFF] = [BUFFTYPE.SLOWMO];
			map[? POTION_MAP.PARTICLE] = PARTICLES.FROST;
			map[? POTION_MAP.PARTICLE_SPLASH_COLOR] = c_white;
			map[? POTION_MAP.PARTICLE_AMT] = 5;
			break;
			
		case WEAPON_POTION_TYPE.SLIME:
			map[? POTION_MAP.NAME] = "Potion of Gunk";
			map[? POTION_MAP.DESCRIPTION] = "Apply directly to clean surfaces";
			map[? POTION_MAP.PROJECTILE] = POTION_SPRITE.SLIME;
			map[? POTION_MAP.COOLDOWN] = 60;
			map[? POTION_MAP.SPEED] = 9;
			map[? POTION_MAP.DAMAGE] = 11;
			map[? POTION_MAP.BUFF] = [BUFFTYPE.SLIME];
			map[? POTION_MAP.PARTICLE] = PARTICLES.SLIME;
			map[? POTION_MAP.PARTICLE_SPLASH_COLOR] = c_lime;
			map[? POTION_MAP.WALL_COLLIDE] = true;
			map[? POTION_MAP.WALL_SCRIPT] = scPotion_Slime_WallScript;
			break;
			
		case WEAPON_POTION_TYPE.ELECTRIC:
			map[? POTION_MAP.NAME] = "Potion of Voltage";
			map[? POTION_MAP.DESCRIPTION] = "Sprinkle and mix with beverage for added electrolytes";
			map[? POTION_MAP.PROJECTILE] = POTION_SPRITE.ELECTRIC;
			map[? POTION_MAP.COOLDOWN] = 70;
			map[? POTION_MAP.SPEED] = 9;
			map[? POTION_MAP.DAMAGE] = 7;
			map[? POTION_MAP.PARTICLE] = PARTICLES.LIGHTNING;
			map[? POTION_MAP.PARTICLE_SPLASH_COLOR] = c_yellow;
			map[? POTION_MAP.WALL_COLLIDE] = true;
			map[? POTION_MAP.WALL_SCRIPT] = scPotion_Electric_WallScript;
			map[? POTION_MAP.DELETE_ON_HIT] = false;
			break;
			
		case WEAPON_POTION_TYPE.BRICK:
			map[? POTION_MAP.NAME] = "Potion of Brick";
			map[? POTION_MAP.DESCRIPTION] = "Do not eat";
			map[? POTION_MAP.PROJECTILE] = POTION_SPRITE.BRICK;
			map[? POTION_MAP.COOLDOWN] = 60;
			map[? POTION_MAP.SPEED] = 9;
			map[? POTION_MAP.DAMAGE] = 15;
			map[? POTION_MAP.DELETE_ON_HIT] = false;
			map[? POTION_MAP.PARTICLE] = PARTICLES.SLOWMO;
			map[? POTION_MAP.PARTICLE_SPLASH_COLOR] = c_maroon;
			break;
		
		case WEAPON_POTION_TYPE.METAL:
			map[? POTION_MAP.NAME] = "Potion of Shards";
			map[? POTION_MAP.DESCRIPTION] = "Useful for particularly rough samples";
			map[? POTION_MAP.PROJECTILE] = POTION_SPRITE.METAL;
			map[? POTION_MAP.COOLDOWN] = 30;
			map[? POTION_MAP.SPEED] = 10;
			map[? POTION_MAP.DAMAGE] = 8;
			map[? POTION_MAP.PARTICLE] = PARTICLES.SPARKLE;
			map[? POTION_MAP.PARTICLE_SPLASH_COLOR] = c_white;
			map[? POTION_MAP.WALL_COLLIDE] = true;
			map[? POTION_MAP.WALL_SCRIPT] = scPotion_Portal_WallScript;
			break;
		
		case WEAPON_POTION_TYPE.SHOTGUN:
			map[? POTION_MAP.NAME] = "Potion of Plenty";
			map[? POTION_MAP.DESCRIPTION] = "A duplicating solution that solves nothing";
			map[? POTION_MAP.PROJECTILE] = POTION_SPRITE.SHOTGUN;
			map[? POTION_MAP.COOLDOWN] = 2;
			map[? POTION_MAP.CLIP] = 5;
			map[? POTION_MAP.RELOAD_TIME] = 80;
			map[? POTION_MAP.SPEED] = 9;
			map[? POTION_MAP.DAMAGE] = 5;
			map[? POTION_MAP.PARTICLE] = PARTICLES.SPEED;
			map[? POTION_MAP.PARTICLE_SPLASH_COLOR] = c_olive;
			break;

		case WEAPON_POTION_TYPE.PORTAL:
			map[? POTION_MAP.NAME] = "Potion of Continuity";
			map[? POTION_MAP.DESCRIPTION] = "An experimental liquid still being studied";
			map[? POTION_MAP.PROJECTILE] = POTION_SPRITE.PORTAL;
			map[? POTION_MAP.COOLDOWN] = 60;
			map[? POTION_MAP.SPEED] = 10;
			map[? POTION_MAP.DAMAGE] = 9;
			map[? POTION_MAP.PARTICLE] = PARTICLES.MAGNET;
			map[? POTION_MAP.PARTICLE_SPLASH_COLOR] = c_fuchsia;
			map[? POTION_MAP.HIT_SCRIPT] = scPotion_Portal_HitScript;
			break;

	    case WEAPON_POTION_TYPE.DEFAULT:
		default:
			map[? POTION_MAP.NAME] = "Potion of Ocean";
			map[? POTION_MAP.DESCRIPTION] = "A dull concoction of no effect";
			map[? POTION_MAP.PROJECTILE] = POTION_SPRITE.DEFAULT;
			map[? POTION_MAP.COOLDOWN] = 40;
			map[? POTION_MAP.SPEED] = 10;
			map[? POTION_MAP.DAMAGE] = 10;
			break;
	}

	return map;


}
