/// @desc get the ultimate ds map
/// @arg ultimate-type you want to grab
/// @arg ds_map you want to copy to

var type = argument0;
var ds_map = argument1;

//Defaults
ds_map[? ULTIMATE_MAP.CAST_TIME] = 15; //Defaulted to 25/60th of a second
ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_STEP] = noone; //Script when casting an ult
ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = noone; //Draw script when casting an ult
ds_map[? ULTIMATE_MAP.CASTED_SCRIPT_DRAW] = noone; //Draw script when ult casted
ds_map[? ULTIMATE_MAP.SOUND_CAST] = noone; //Default sound of the ultimate being casted
ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = noone; //The object to spawn
ds_map[? ULTIMATE_MAP.CASTED_DEPTH] = -1; //The object to spawn
ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = noone; //The script to execute when casted

switch (type) {
	case ULTIMATE.DEFAULT: //Huge af cloned rocket
		ds_map[? ULTIMATE_MAP.NAME] = "Mr.Huge!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateDefault;
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
	case ULTIMATE.HUGEEXPLOSION: //I Cant See!
		ds_map[? ULTIMATE_MAP.NAME] = "Honey don't go outside!";
		ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateHugesplosion;
		ds_map[? ULTIMATE_MAP.CASTED_DEPTH] = 1;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateHugesplosionDraw;
		//ds_map[? ULTIMATE_MAP.CAST_TIME] = 20;
		break;
	case ULTIMATE.CLONE: //Huh, the cake isnt a lie afterall
		ds_map[? ULTIMATE_MAP.NAME] = "Portal dimension";
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
		break;
	case ULTIMATE.LIGHTNING_ORB:
		ds_map[? ULTIMATE_MAP.NAME] = "Oh, its gonna hurt";
		ds_map[? ULTIMATE_MAP.CASTED_OBJECT] = oUltimateLightning;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLightningDraw;
		break;
}

enum ULTIMATE {
	DEFAULT, BARRAGE, SPRAY, HUGEEXPLOSION, CLONE, SWIPE, SHIELD,
	MIRROR, HOMING, LASER, TRAP, MAGNET, SLUDGE, NAPALM, LIGHTNING_ORB,
	
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