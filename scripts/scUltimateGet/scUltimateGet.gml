/// @desc get the ultimate ds map
/// @arg ultimate-type you want to grab
/// @arg ds_map you want to copy to

var type = argument0;
var ds_map = argument1;

//The amount of time u need to press the shoot button to ult
ds_map[? ULTIMATE_MAP.CAST_TIME] = 25; //Defaulted to 25/60th of a second
ds_map[? ULTIMATE_MAP.SCRIPT_CASTING] = noone; //Defaulted to aviod errors
ds_map[? ULTIMATE_MAP.SOUND_CAST] = noone; //Default sound of the ultimate being casted

switch (type) {
	case ULTIMATE.DEFAULT: //Huge af cloned rocket
		ds_map[? ULTIMATE_MAP.NAME] = "Mr.Huge!";
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTED] = scUltimateDefault;
		break;
	case ULTIMATE.LASERS: //Dodge the lasers!
		ds_map[? ULTIMATE_MAP.NAME] = "Termination";
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTED] = scUltimateLaser;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 30;
		break;
	case ULTIMATE.FAST: //Triple threat!
		ds_map[? ULTIMATE_MAP.NAME] = "Angry Bird!";
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTED] = scUltimateFast;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 20;
		break;
	case ULTIMATE.SAND: //I Cant See!
		ds_map[? ULTIMATE_MAP.NAME] = "Honey don't go outside!";
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTED] = scUltimateSand;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 20;
		break;
	case ULTIMATE.REVERSE: //Huh, the cake isnt a lie afterall
		ds_map[? ULTIMATE_MAP.NAME] = "Portal dimension";
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTED] = scUltimateReverse;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 55;
		break;
	case ULTIMATE.SWIPE: //Oh wow, point blank and still missed
		ds_map[? ULTIMATE_MAP.NAME] = "Ur gonna hate this";
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTED] = scUltimateSwipe;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 30;
		break;
	case ULTIMATE.SHIELD: //Huh, that exists
		ds_map[? ULTIMATE_MAP.NAME] = "Youuuu shall not Passssss!";
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTED] = scUltimateShield;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 15;
		ds_map[? ULTIMATE_MAP.SOUND_CAST] = SOUND.ULT_SHIELD_CAST;
		break;
	case ULTIMATE.MIRROR: //Oh, now its going this way
		ds_map[? ULTIMATE_MAP.NAME] = "Magical mirror";
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTED] = scUltimateMirror;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 20;
		break;
	case ULTIMATE.HOMING: 
		ds_map[? ULTIMATE_MAP.NAME] = "Rocket Barrage";
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTED] = scUltimateHoming;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 10;
}

enum ULTIMATE {
	DEFAULT, LASERS, FAST, SAND, REVERSE, SWIPE, SHIELD, MIRROR, HOMING,
	
	//PUT LAST
	LENGTH
}

enum ULTIMATE_MAP {
	NAME, SCRIPT_CASTING, SCRIPT_CASTED, CAST_TIME,
	//SOUND
	SOUND_CAST
}