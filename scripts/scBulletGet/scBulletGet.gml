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
	//map[? BULLET_MAP.POWER] = 500;
	map[? BULLET_MAP.POWER_MAX] = 0; 
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
			map[? BULLET_MAP.COOLDOWN] = 40;
			map[? BULLET_MAP.SPEED] = 32;
			map[? BULLET_MAP.DAMPENING] = 1;
			map[? BULLET_MAP.DAMAGE] = 12;
			break;
			
		case WEAPON_BULLET_TYPE.ICE:
			map[? BULLET_MAP.NAME] = "Ice Bullet";
			map[? BULLET_MAP.DESCRIPTION] = "How is this still intact?";
			map[? BULLET_MAP.COOLDOWN] = 50;
			map[? BULLET_MAP.SPEED] = 25;
			map[? BULLET_MAP.PROJECTILE] = BULLET_SPRITE.ICE;
			map[? BULLET_MAP.DAMPENING] = 1;
			map[? BULLET_MAP.POWER_MAX] = 0;
			map[? BULLET_MAP.DAMAGE] = 15;
			map[? BULLET_MAP.BUFF] = [BUFFTYPE.CHILLED];
			map[? BULLET_MAP.DAMAGE_ELEMENT] = DAMAGE_ELEMENT.COLD;
			break;
			
		case WEAPON_BULLET_TYPE.FIRE:
			map[? BULLET_MAP.NAME] = "Fire Bullet";
			map[? BULLET_MAP.DESCRIPTION] = "Isn't this a flamethrower?";
			map[? BULLET_MAP.COOLDOWN] = 8;
			map[? BULLET_MAP.CLIP] = 8;
			map[? BULLET_MAP.RELOAD_TIME] = 200;
			map[? BULLET_MAP.PROJECTILE] = BULLET_SPRITE.FIRE;
			map[? BULLET_MAP.SPEED] = 26;
			map[? BULLET_MAP.DAMPENING] = 0.98;
			map[? BULLET_MAP.POWER_MAX] = 0;
			map[? BULLET_MAP.DAMAGE] = 4;
			map[? BULLET_MAP.DAMAGE_ELEMENT] = DAMAGE_ELEMENT.FIRE;
			break;
			
		case WEAPON_BULLET_TYPE.SLIME:
			map[? BULLET_MAP.NAME] = "Slime Bullet";
			map[? BULLET_MAP.DESCRIPTION] = "Why is it so sticky?";
			map[? BULLET_MAP.COOLDOWN] = 30;
			map[? BULLET_MAP.PROJECTILE] = BULLET_SPRITE.SLIME;
			map[? BULLET_MAP.SPEED] = 30;
			//map[? BULLET_MAP.DAMPENING] = 0.95;
			map[? BULLET_MAP.POWER_MAX] = 0;
			map[? BULLET_MAP.DAMAGE] = 8;
			map[? BULLET_MAP.DAMAGE_TYPE] = DAMAGE_TYPE.NONE;
			map[? BULLET_MAP.DAMAGE_ELEMENT] = DAMAGE_ELEMENT.SLIME;
			map[? BULLET_MAP.KBAMT] = 1.5;
			break;
			
		case WEAPON_BULLET_TYPE.PORTAL:
			map[? BULLET_MAP.NAME] = "Portal Bullet";
			map[? BULLET_MAP.DESCRIPTION] = "Where is this going?";
			map[? BULLET_MAP.COOLDOWN] = 40;
			map[? BULLET_MAP.PROJECTILE] = BULLET_SPRITE.PORTAL;
			map[? BULLET_MAP.SPEED] = 5;
			map[? BULLET_MAP.DAMPENING] = 1.05;
			map[? BULLET_MAP.POWER_MAX] = 0;
			map[? BULLET_MAP.DAMAGE] = 12;
			map[? BULLET_MAP.KBAMT] = -1;
			break;
			
		case WEAPON_BULLET_TYPE.METAL:
			map[? BULLET_MAP.NAME] = "Metal Bullet";
			map[? BULLET_MAP.DESCRIPTION] = "What is so special about this?";
			map[? BULLET_MAP.COOLDOWN] = 90;
			map[? BULLET_MAP.PROJECTILE] = BULLET_SPRITE.METAL;
			map[? BULLET_MAP.SPEED] = 62;
			map[? BULLET_MAP.DAMAGE] = 20;
			map[? BULLET_MAP.RECOIL] = 2;
			map[? BULLET_MAP.KBAMT] = 0;
			break;
			
		case WEAPON_BULLET_TYPE.BRICK:
			map[? BULLET_MAP.NAME] = "Brick Bullet";
			map[? BULLET_MAP.DESCRIPTION] = "Finally, something that makes sense.";
			map[? BULLET_MAP.COOLDOWN] = 40;
			map[? BULLET_MAP.PROJECTILE] = BULLET_SPRITE.BRICK;
			map[? BULLET_MAP.SPEED] = 20;
			map[? BULLET_MAP.DAMAGE] = 20;
			map[? BULLET_MAP.RECOIL] = 1;
			map[? BULLET_MAP.KBAMT] = 2;
			break;	
			
		case WEAPON_BULLET_TYPE.SHOTGUN:
			map[? BULLET_MAP.NAME] = "Shotgun Bullet";
			map[? BULLET_MAP.DESCRIPTION] = "Isn't this just a shell?";
			map[? BULLET_MAP.COOLDOWN] = 120;
			map[? BULLET_MAP.PROJECTILE] = BULLET_SPRITE.SHOTGUN;
			map[? BULLET_MAP.SPEED] = 34;
			map[? BULLET_MAP.DAMAGE] = 5;
			map[? BULLET_MAP.RECOIL] = 0.8;
			map[? BULLET_MAP.KBAMT] = 0.2;
			map[? BULLET_MAP.SPAWN_SCRIPT] = scBullet_Shotgun_Spawn;
			break;
			
		case WEAPON_BULLET_TYPE.ELECTRIC:
			map[? BULLET_MAP.NAME] = "Electric Bullet";
			map[? BULLET_MAP.DESCRIPTION] = "Isn't this a taser?";
			map[? BULLET_MAP.COOLDOWN] = 3;
			map[? BULLET_MAP.PROJECTILE] = BULLET_SPRITE.ELECTRIC;
			map[? BULLET_MAP.SPEED] = 60;
			map[? BULLET_MAP.CLIP] = 4;
			map[? BULLET_MAP.RELOAD_TIME] = 120;
			//map[? BULLET_MAP.POWER] = 100;
			map[? BULLET_MAP.DAMAGE] = 4;
			map[? BULLET_MAP.RECOIL] = 0.2;
			map[? BULLET_MAP.KBAMT] = 0.1;
			map[? BULLET_MAP.DAMAGE_ELEMENT] = DAMAGE_ELEMENT.SHOCK;
			break;
		
	}

	return map;


}
