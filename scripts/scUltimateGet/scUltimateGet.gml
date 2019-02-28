/// @desc get the ultimate ds map
/// @arg ultimate-type you want to grab
/// @arg ds_map you want to copy to

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
	case ULTIMATE.NONE: //nuthing
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = noone;
		break;
	case ULTIMATE.DEFAULT: //Huge af cloned rocket
		ds_map[? ULTIMATE_MAP.NAME] = "Mr.Huge!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateDefault;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLaserDraw;
		ds_map[? "casting_tiem"] = 0;
		break;
	case ULTIMATE.BARRAGE: //Dodge the lasers!
		ds_map[? ULTIMATE_MAP.NAME] = "Termination";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateBarrage;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 30;
		break;
	case ULTIMATE.SPRAY: //Triple threat!
		ds_map[? ULTIMATE_MAP.NAME] = "Angry Bird!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSpray;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateSprayDraw;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 20;
		break;
	case ULTIMATE.HUGEEXPLOSION: //It's gonna be huge!
		ds_map[? ULTIMATE_MAP.NAME] = "Honey don't go outside!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateHugesplosion;
		ds_map[? ULTIMATE_MAP.CASTED_DEPTH] = 1;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateHugesplosion_Draw;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 20;
		break;
	case ULTIMATE.CLONE: //Huh, the cake isnt a lie afterall
		ds_map[? ULTIMATE_MAP.NAME] = "From another dimension";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateClone;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateCloneDraw;
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT_DRAW] = scUltimateCloneDrawCasted;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 20;
		break;
	case ULTIMATE.SWIPE: //Oh wow, point blank and still missed
		ds_map[? ULTIMATE_MAP.NAME] = "Ur gonna hate this";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSwipe;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 30;
		break;
	case ULTIMATE.SHIELD: //Huh, that exists
		ds_map[? ULTIMATE_MAP.NAME] = "Youuuu shall not Passssss!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateShield;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 15;
		ds_map[? ULTIMATE_MAP.SOUND_CAST] = SOUND.ULT_SHIELD_CAST;
		break;
	case ULTIMATE.MIRROR: //Oh, now its going this way
		ds_map[? ULTIMATE_MAP.NAME] = "Magical mirror";
		ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateMirror;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateMirrorDraw;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 20;
		break;
	case ULTIMATE.HOMING: 
		ds_map[? ULTIMATE_MAP.NAME] = "Rocket Barrage";
		ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateHoming;
		ds_map[? ULTIMATE_MAP.CASTED_DEPTH] = 1;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateHomingDraw;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 10;
		break;
	case ULTIMATE.LASER: 
		ds_map[? ULTIMATE_MAP.NAME] = "Lets Delete them!";
		ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateLaser;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLaserDraw;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 25;
		break;
	case ULTIMATE.TRAP: 
		ds_map[? ULTIMATE_MAP.NAME] = "Gotcha";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateTrap;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateTrapDraw;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 10;
		break;
	case ULTIMATE.MAGNET: 
		ds_map[? ULTIMATE_MAP.NAME] = "Get Over Here!";
		ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateMagnet;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateMagnetDraw;
		ds_map[? ULTIMATE_MAP.CASTED_DEPTH] = 1;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 10;
		break;
	case ULTIMATE.SLUDGE:
		ds_map[? ULTIMATE_MAP.NAME] = "Icky goo!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSludge;
		ds_map[? "amount"] = 10; //Amount of sludge to cast
		break;
	case ULTIMATE.NAPALM:
		ds_map[? ULTIMATE_MAP.NAME] = "The floor is lava!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateNapalm_Casted;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateNapalm_CastingDraw;
		break;
	case ULTIMATE.LIGHTNING_ORB:
		ds_map[? ULTIMATE_MAP.NAME] = "Oh, its gonna hurt";
		ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateLightning;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLightningDraw;
		break;
	case ULTIMATE.SLOWMO:
		ds_map[? ULTIMATE_MAP.NAME] = "Bullet time!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSlowmo;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLaserDraw;
		break;
	case ULTIMATE.SLEEPDART:
		ds_map[? ULTIMATE_MAP.NAME] = "Sleep boi!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSleepDart;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateHomingDraw;
		break;
	case ULTIMATE.PORTAL:
		ds_map[? ULTIMATE_MAP.NAME] = "Portal... 2!";
		ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimatePortal;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateCloneDraw;
		ds_map[? ULTIMATE_MAP.CASTED_DEPTH] = 1;
		break;
	case ULTIMATE.MINISPRAY:
		ds_map[? ULTIMATE_MAP.NAME] = "Mini spray!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateMiniSpray;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLaserDraw;
		break;
	case ULTIMATE.BRICKWALL:
		ds_map[? ULTIMATE_MAP.NAME] = "ITS GONNA BE HUGE!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateBrickWall;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateBrickWall_Draw;
		ds_map[? "size"] = 4; //yscale of wall
		ds_map[? "dis"] = 50; //distance between player and wall
		ds_map[? "ult"] = oUltimateBrickWall;
		break;
	case ULTIMATE.AMPWALL:
		ds_map[? ULTIMATE_MAP.NAME] = "ITS GONNA BE HUGE!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateBrickWall;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateBrickWall_Draw;
		ds_map[? "size"] = 6; //yscale of wall
		ds_map[? "dis"] = 50; //distance between player and wall
		ds_map[? "ult"] = oUltimateAmpWall;
		break;
	case ULTIMATE.TURRET:
		ds_map[? ULTIMATE_MAP.NAME] = "Noob!";
		ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateTurret;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateTurret_Draw;
		break;
}

enum ULTIMATE {
	DEFAULT, BARRAGE, SPRAY, HUGEEXPLOSION, CLONE, SWIPE, SHIELD,
	MIRROR, HOMING, LASER, TRAP, MAGNET, SLUDGE, NAPALM, LIGHTNING_ORB,
	SLOWMO, SLEEPDART, PORTAL, MINISPRAY, BRICKWALL, AMPWALL, TURRET,
	NONE,
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