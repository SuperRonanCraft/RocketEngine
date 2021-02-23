/// @desc get the ultimate ds map
/// @arg ultimate-type you want to grab
/// @arg ds_map you want to copy to
function scUltimateGet(argument0, argument1) {

	var type = argument0;
	var ds_map = argument1;
	var time = TIME_SPEED;

	//Defaults
	ds_map[? ULTIMATE_MAP.CAST_TIME] = 15 * time; //Defaulted to 15/30th of a second
	ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_STEP] = noone; //Script when casting an ult
	ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = noone; //Draw script when casting an ult
	ds_map[? ULTIMATE_MAP.CASTED_SCRIPT_DRAW] = noone; //Draw script when ult casted
	ds_map[? ULTIMATE_MAP.SOUND_CAST] = noone; //Default sound of the ultimate being casted
	ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = noone; //The object to spawn
	ds_map[? ULTIMATE_MAP.CASTED_DEPTH] = -1; //The object to spawn
	ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = noone; //The script to execute when casted

	switch (type) {
		case ULTIMATE_TYPE.NONE: //nuthing
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = noone;
			break;
		case ULTIMATE_TYPE.DEFAULT: //Huge af cloned rocket
			ds_map[? ULTIMATE_MAP.NAME] = "Mr.Huge!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateDefault;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLaser_Draw;
			break;
		case ULTIMATE_TYPE.BARRAGE: //Dodge the lasers!
			ds_map[? ULTIMATE_MAP.NAME] = "Termination";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateBarrage;
			break;
		case ULTIMATE_TYPE.SPRAY: //Triple threat!
			ds_map[? ULTIMATE_MAP.NAME] = "Angry Bird!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSpray;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateSpray_Draw;
			ds_map[? "amt"] = 8; //amount of rockets in 90 degree cone
			break;
		case ULTIMATE_TYPE.HUGEEXPLOSION: //It's gonna be huge!
			ds_map[? ULTIMATE_MAP.NAME] = "Honey don't go outside!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateHugesplosion;
			ds_map[? ULTIMATE_MAP.CASTED_DEPTH] = 1;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateHugesplosion_Draw;
			break;
		case ULTIMATE_TYPE.CLONE: //Huh, the cake isnt a lie afterall
			ds_map[? ULTIMATE_MAP.NAME] = "From another dimension";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateClone;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateClone_Draw;
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT_DRAW] = scUltimateClone_DrawCasted;
			break;
		case ULTIMATE_TYPE.MIRROR: //Oh, now its going this way
			ds_map[? ULTIMATE_MAP.NAME] = "Magical mirror";
			ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateMirror;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateMirror_Draw;
			break;
		case ULTIMATE_TYPE.HOMING: 
			ds_map[? ULTIMATE_MAP.NAME] = "Rocket Barrage";
			ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateHoming;
			ds_map[? ULTIMATE_MAP.CASTED_DEPTH] = 1;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateHoming_Draw;
			break;
		case ULTIMATE_TYPE.LASER: 
			ds_map[? ULTIMATE_MAP.NAME] = "Lets Delete them!";
			ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateLaser;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLaser_Draw;
			break;
		case ULTIMATE_TYPE.TRAP: 
			ds_map[? ULTIMATE_MAP.NAME] = "Gotcha";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateTrap;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateTrap_Draw;
			break;
		case ULTIMATE_TYPE.MAGNET: 
			ds_map[? ULTIMATE_MAP.NAME] = "Get Over Here!";
			ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateMagnet;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateMagnet_Draw;
			ds_map[? ULTIMATE_MAP.CASTED_DEPTH] = 1;
			break;
		case ULTIMATE_TYPE.SLUDGE:
			ds_map[? ULTIMATE_MAP.NAME] = "Icky goo!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSludge;
			ds_map[? "amount"] = 10; //Amount of sludge to cast
			break;
		case ULTIMATE_TYPE.NAPALM:
			ds_map[? ULTIMATE_MAP.NAME] = "The floor is lava!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateNapalm_Casted;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateNapalm_CastingDraw;
			break;
		case ULTIMATE_TYPE.LIGHTNING_ORB:
			ds_map[? ULTIMATE_MAP.NAME] = "Oh, its gonna hurt";
			ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateLightning; //oUltimateLightning2;
			//ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLightning_Draw;
			break;
		case ULTIMATE_TYPE.SLOWMO:
			ds_map[? ULTIMATE_MAP.NAME] = "Bullet time!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSlowmo;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLaser_Draw;
			break;
		case ULTIMATE_TYPE.SLEEPDART:
			ds_map[? ULTIMATE_MAP.NAME] = "Sleep boi!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSleepDart;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateHoming_Draw;
			break;
		case ULTIMATE_TYPE.PORTAL:
			ds_map[? ULTIMATE_MAP.NAME] = "Portal... 2!";
			ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimatePortal;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimatePortal_Draw;
			ds_map[? ULTIMATE_MAP.CASTED_DEPTH] = 1;
			break;
		case ULTIMATE_TYPE.BRICKWALL:
			ds_map[? ULTIMATE_MAP.NAME] = "ITS GONNA BE HUGE!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateBrickWall;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateBrickWall_Draw;
			ds_map[? "size"] = 5; //yscale of wall
			ds_map[? "offset"] = 0; //how far to offset downward
			ds_map[? "thickness"] = 2; //how thick walls are
			ds_map[? "dis"] = 32; //distance between player and wall
			ds_map[? "ult"] = oUltimateBrickWall;
			break;
		case ULTIMATE_TYPE.AMPWALL:
			ds_map[? ULTIMATE_MAP.NAME] = "ITS GONNA BE STRONG!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateAmpWall;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateAmpWall_Draw;
			ds_map[? "size"] = 6; //yscale of wall
			ds_map[? "dis"] = 50; //distance between player and wall
			ds_map[? "ult"] = oUltimateAmpWall;
			break;
		case ULTIMATE_TYPE.TURRET:
			ds_map[? ULTIMATE_MAP.NAME] = "Noob!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateGeneral_Outline_Object;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateGeneral_Outline_Draw;
			ds_map[? "dis"] = 80;
			ds_map[? "hei"] = -20;
			ds_map[? "obj"] = oUltimateTurret;
			ds_map[? "spr"] = sUltTurretDraw;
			ds_map[? "scl"] = 0.7;
			break;
		case ULTIMATE_TYPE.ORBIT:
			ds_map[? ULTIMATE_MAP.NAME] = "Shield 2.0!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateOrbit;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateOrbit_Draw;
			ds_map[? "dis"] = 120; //distance between rocket and player
			ds_map[? "amt"] = 5; //amt of rockets
			ds_map[? "ang"] = 0; //for animating
			ds_map[? "ang_chg"] = 2; //for animating
			break;
		case ULTIMATE_TYPE.HACKLOOT:
			ds_map[? ULTIMATE_MAP.NAME] = "Shield 2.0!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateHackLoot;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateHackLoot_Draw;
			break;
		case ULTIMATE_TYPE.JUMPPAD:
			ds_map[? ULTIMATE_MAP.NAME] = "BOUNCE!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateGeneral_Outline_Object;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateGeneral_Outline_Draw;
			ds_map[? "dis"] = 80;
			ds_map[? "hei"] = -20;
			ds_map[? "obj"] = oUltimateJumpPad;
			ds_map[? "spr"] = sUltJumpPadDraw;
			ds_map[? "scl"] = 1;
			break;
		case ULTIMATE_TYPE.FROSTY:
			ds_map[? ULTIMATE_MAP.NAME] = "Frosty the snowman!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateGeneral_Outline_Object;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateGeneral_Outline_Draw;
			ds_map[? "dis"] = 80;
			ds_map[? "hei"] = -32;
			ds_map[? "obj"] = oUltimateFrosty;
			ds_map[? "spr"] = sUltFrosty;
			ds_map[? "scl"] = 1;
			break;
		
		case ULTIMATE_TYPE.DEFAULT_SWORD:
			ds_map[? ULTIMATE_MAP.NAME] = "A sophisticated slash.";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSwordDefault;
			ds_map[? ULTIMATE_MAP.CAST_TIME] = 5;
			break;
		
		case ULTIMATE_TYPE.ICE_SWORD:
			ds_map[? ULTIMATE_MAP.NAME] = "A chilling cut.";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSwordIce;
			ds_map[? ULTIMATE_MAP.CAST_TIME] = 5;
			break;
		
		case ULTIMATE_TYPE.FIRE_SWORD:
			ds_map[? ULTIMATE_MAP.NAME] = "A blade of flame.";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSwordFire;
			ds_map[? ULTIMATE_MAP.CAST_TIME] = 5;
			break;
		
		case ULTIMATE_TYPE.LIGHTNING_SWORD:
			ds_map[? ULTIMATE_MAP.NAME] = "A sharp spark.";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSwordLightning;
			ds_map[? ULTIMATE_MAP.CAST_TIME] = 5;
			break;
		
		case ULTIMATE_TYPE.PORTAL_SWORD:
			ds_map[? ULTIMATE_MAP.NAME] = "A warping slice.";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSwordPortal;
			ds_map[? ULTIMATE_MAP.CAST_TIME] = 5;
			break;
		
		case ULTIMATE_TYPE.SAND_SWORD:
			ds_map[? ULTIMATE_MAP.NAME] = "A blinding bite.";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSwordSand;
			ds_map[? ULTIMATE_MAP.CAST_TIME] = 5;
			break;
		
		case ULTIMATE_TYPE.BRICK_SWORD:
			ds_map[? ULTIMATE_MAP.NAME] = "A colossal clash.";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSwordBrick;
			ds_map[? ULTIMATE_MAP.CAST_TIME] = 5;
			break;
		
		case ULTIMATE_TYPE.SLIME_SWORD:
			ds_map[? ULTIMATE_MAP.NAME] = "A slimy splash.";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSwordSlime;
			ds_map[? ULTIMATE_MAP.CAST_TIME] = 5;
			break;
		
		case ULTIMATE_TYPE.METAL_SWORD:
			ds_map[? ULTIMATE_MAP.NAME] = "A massive slam.";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSwordMetal;
			ds_map[? ULTIMATE_MAP.CAST_TIME] = 5;
			break;
		
		case ULTIMATE_TYPE.SHOTGUN_SWORD:
			ds_map[? ULTIMATE_MAP.NAME] = "A succesive strike.";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSwordShotgun;
			ds_map[? ULTIMATE_MAP.CAST_TIME] = 5;
			break;
	}

	enum ULTIMATE_TYPE {
		DEFAULT, BARRAGE, SPRAY, HUGEEXPLOSION, CLONE,
		MIRROR, HOMING, LASER, TRAP, MAGNET, SLUDGE, NAPALM, LIGHTNING_ORB,
		SLOWMO, SLEEPDART, PORTAL, BRICKWALL, AMPWALL, TURRET,
		ORBIT, HACKLOOT, JUMPPAD, FROSTY,
	
		//SWORD ULTS
		DEFAULT_SWORD,ICE_SWORD,FIRE_SWORD,LIGHTNING_SWORD,PORTAL_SWORD,SAND_SWORD,
		BRICK_SWORD, SLIME_SWORD, METAL_SWORD,SHOTGUN_SWORD,
	
		NONE,
		//SWIPE, SHIELD, MINISPRAY,
		//PUT LAST
		LENGTH
	}

	enum ULTIMATE_MAP {
		NAME, SCRIPT_CASTING_STEP, SCRIPT_CASTING_DRAW, CAST_TIME,
		//CASTED
		CASTED_OBJECT, CASTED_DEPTH, CASTED_SCRIPT, CASTED_SCRIPT_DRAW,
		//SOUND
		SOUND_CAST
	}

	//OLD ULTIMATES
	/*
		case ULTIMATE_TYPE.SHIELD: //Huh, that exists
			ds_map[? ULTIMATE_MAP.NAME] = "Youuuu shall not Passssss!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateShield;
			//ds_map[? ULTIMATE_MAP.CAST_TIME] = 15;
			ds_map[? ULTIMATE_MAP.SOUND_CAST] = SOUND.ULT_SHIELD_CAST;
			break;
		case ULTIMATE_TYPE.MINISPRAY:
			ds_map[? ULTIMATE_MAP.NAME] = "Mini spray!";
			ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateMiniSpray;
			ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLaser_Draw;
			break;*/


}
