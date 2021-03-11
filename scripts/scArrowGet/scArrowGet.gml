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
	map[? ARROW_MAP.DAMAGE] = 3;

	//Custom Values
	switch (wep) {
	    case WEAPON_ARROW_TYPE.NONE:
	        map[? ARROW_MAP.DAMAGE] = 0;
			//map[? ARROW_MAP.ULTIMATE] = ULTIMATE.NONE;
	        break;
	    case WEAPON_ARROW_TYPE.DEFAULT:
			map[? ARROW_MAP.NAME] = "Normal Arrow";
			map[? ARROW_MAP.DESCRIPTION] = "As basic as they come.";
			map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.DEFAULT;
			map[? ARROW_MAP.COOLDOWN] = 40;
			map[? ARROW_MAP.SPEED] = 10;
			map[? ARROW_MAP.POWER] = 500;
			map[? ARROW_MAP.POWER_MAX] = 300; 
			map[? ARROW_MAP.KBAMT] = 5;
			map[? ARROW_MAP.WEIGHT] = 8;
			map[? ARROW_MAP.DAMAGE] = 4;
			break;
	    case WEAPON_ARROW_TYPE.FIRE:
			map[? ARROW_MAP.NAME] = "Fire Arrow";
			map[? ARROW_MAP.DESCRIPTION] = "Hot and painful.";
			map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.FIRE;
			map[? ARROW_MAP.COOLDOWN] = 40;
			map[? ARROW_MAP.SPEED] = 10;
			map[? ARROW_MAP.BUFF] = [BUFFTYPE.BURNRUSH];
			map[? ARROW_MAP.POWER] = 500;
			map[? ARROW_MAP.POWER_MAX] = 300; 
			map[? ARROW_MAP.KBAMT] = 5;
			map[? ARROW_MAP.WEIGHT] = 8;
			map[? ARROW_MAP.DAMAGE] = 3;
			break;
	    case WEAPON_ARROW_TYPE.ICE:
			map[? ARROW_MAP.NAME] = "Ice Arrow";
			map[? ARROW_MAP.DESCRIPTION] = "Cold and sharp.";
			map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.ICE;
			map[? ARROW_MAP.COOLDOWN] = 40;
			map[? ARROW_MAP.BUFF] = [BUFFTYPE.CHILLED];
			map[? ARROW_MAP.SPEED] = 10;
			map[? ARROW_MAP.POWER] = 500;
			map[? ARROW_MAP.POWER_MAX] = 300; 
			map[? ARROW_MAP.KBAMT] = 5;
			map[? ARROW_MAP.WEIGHT] = 8;
			map[? ARROW_MAP.DAMAGE] = 3;
			break;
	    case WEAPON_ARROW_TYPE.SLIME:
			map[? ARROW_MAP.NAME] = "Slime Arrow";
			map[? ARROW_MAP.DESCRIPTION] = "Weird and squishy.";
			map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.SLIME;
			map[? ARROW_MAP.COOLDOWN] = 40;
			map[? ARROW_MAP.BUFF] = [BUFFTYPE.SLIME];
			map[? ARROW_MAP.SPEED] = 10;
			map[? ARROW_MAP.POWER] = 500;
			map[? ARROW_MAP.POWER_MAX] = 300; 
			map[? ARROW_MAP.KBAMT] = 5;
			map[? ARROW_MAP.WEIGHT] = 8;
			map[? ARROW_MAP.DAMAGE] = 2;
			break;
	    case WEAPON_ARROW_TYPE.ELECTRIC:
			map[? ARROW_MAP.NAME] = "Electric Arrow";
			map[? ARROW_MAP.DESCRIPTION] = "Shock and awe.";
			map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.ELECTRIC;
			map[? ARROW_MAP.COOLDOWN] = 55;
			map[? ARROW_MAP.SPEED] = 40;
			map[? ARROW_MAP.POWER] = 300;
			map[? ARROW_MAP.POWER_MAX] = 100; 
			map[? ARROW_MAP.KBAMT] = 1;
			map[? ARROW_MAP.WEIGHT] = 10;
			map[? ARROW_MAP.DAMAGE] = 3;
			break;
	    case WEAPON_ARROW_TYPE.SHOTGUN:
			map[? ARROW_MAP.NAME] = "Multi-shot Arrow";
			map[? ARROW_MAP.DESCRIPTION] = "Arrow and arrow.";
			map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.SHOTGUN;
			map[? ARROW_MAP.COOLDOWN] = 60;
			map[? ARROW_MAP.SPEED] = 10;
			map[? ARROW_MAP.POWER] = 500;
			map[? ARROW_MAP.POWER_MAX] = 300; 
			map[? ARROW_MAP.KBAMT] = 5;
			map[? ARROW_MAP.WEIGHT] = 8;
			map[? ARROW_MAP.DAMAGE] = 1;
			map[? ARROW_MAP.SPAWN_SCRIPT] = scArrow_Shotgun_Spawn;
			break;
	    case WEAPON_ARROW_TYPE.SAND:
			map[? ARROW_MAP.NAME] = "Sand Arrow";
			map[? ARROW_MAP.DESCRIPTION] = "Coarse and rough.";
			map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.SAND;
			map[? ARROW_MAP.COOLDOWN] = 20;
			map[? ARROW_MAP.SPEED] = 15;
			map[? ARROW_MAP.POWER] = 300;
			map[? ARROW_MAP.POWER_MAX] = 200; 
			map[? ARROW_MAP.KBAMT] = 5;
			map[? ARROW_MAP.WEIGHT] = 8;
			map[? ARROW_MAP.DAMAGE] = 3;
			map[? ARROW_MAP.CLIP] = 5;
			map[? ARROW_MAP.RELOAD_TIME] = 50;
			break;
	    case WEAPON_ARROW_TYPE.PORTAL:
			map[? ARROW_MAP.NAME] = "Portal Arrow";
			map[? ARROW_MAP.DESCRIPTION] = "ool. Confusing and c";
			map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.PORTAL;
			map[? ARROW_MAP.COOLDOWN] = 40;
			map[? ARROW_MAP.SPEED] = 10;
			map[? ARROW_MAP.POWER] = 500;
			map[? ARROW_MAP.POWER_MAX] = 300; 
			map[? ARROW_MAP.KBAMT] = 5;
			map[? ARROW_MAP.WEIGHT] = 8;
			map[? ARROW_MAP.DAMAGE] = 4;
			map[? ARROW_MAP.OUT_OF_ROOM_SCRIPT] = scArrow_Portal_OOR;
			map[? ARROW_MAP.WALL_COLLIDE] = false;
			break;
	    case WEAPON_ARROW_TYPE.BRICK:
			map[? ARROW_MAP.NAME] = "Brick Arrow";
			map[? ARROW_MAP.DESCRIPTION] = "Heavy and blunt.";
			map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.BRICK;
			map[? ARROW_MAP.COOLDOWN] = 40;
			map[? ARROW_MAP.BUFF] = [BUFFTYPE.REVERSECONTROLS];
			map[? ARROW_MAP.SPEED] = 10;
			map[? ARROW_MAP.POWER] = 500;
			map[? ARROW_MAP.POWER_MAX] = 300; 
			map[? ARROW_MAP.KBAMT] = 10;
			map[? ARROW_MAP.WEIGHT] = 10;
			map[? ARROW_MAP.DAMAGE] = 5;
			break;
	    case WEAPON_ARROW_TYPE.METAL:
			map[? ARROW_MAP.NAME] = "Metal Arrow";
			map[? ARROW_MAP.DESCRIPTION] = "Tooth and nail.";
			map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.METAL;
			map[? ARROW_MAP.COOLDOWN] = 40;
			map[? ARROW_MAP.BUFF] = [BUFFTYPE.ANTIHEAL];
			map[? ARROW_MAP.SPEED] = 10;
			map[? ARROW_MAP.POWER] = 500;
			map[? ARROW_MAP.POWER_MAX] = 300; 
			map[? ARROW_MAP.KBAMT] = 5;
			map[? ARROW_MAP.WEIGHT] = 8;
			map[? ARROW_MAP.DAMAGE] = 3;
			break;
	}

	return map;


}
