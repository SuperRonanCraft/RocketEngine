/// @desc get the ultimate ds map
/// @arg ultimate-type you want to grab
/// @arg ds_map you want to copy to

var type = argument0;
var ds_map = argument1;

//The amount of time u need to press the shoot button to ult
ds_map[? ULTIMATE_MAP.CAST_TIME] = 25;

switch (type) {
	case ULTIMATE.DEFAULT: //Huge af cloned rocket
		ds_map[? ULTIMATE_MAP.NAME] = "Mr.Huge!";
		ds_map[? ULTIMATE_MAP.SCRIPT] = scUltimateDefault;
		break;
	case ULTIMATE.LASERS: //Dodge the lasers!
		ds_map[? ULTIMATE_MAP.NAME] = "Termination";
		ds_map[? ULTIMATE_MAP.SCRIPT] = scUltimateLaser;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 60;
		break;
	case ULTIMATE.FAST: //Triple threat!
		ds_map[? ULTIMATE_MAP.NAME] = "Angry Bird!";
		ds_map[? ULTIMATE_MAP.SCRIPT] = scUltimateFast;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 40;
		break;
	case ULTIMATE.SAND: //I Cant See!
		ds_map[? ULTIMATE_MAP.NAME] = "Honey don't go outside!";
		ds_map[? ULTIMATE_MAP.SCRIPT] = scUltimateSand;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 120;
		break;
	case ULTIMATE.REVERSE: //Huh, the cake isnt a lie afterall
		ds_map[? ULTIMATE_MAP.NAME] = "Portal dimension";
		ds_map[? ULTIMATE_MAP.SCRIPT] = scUltimateReverse;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 55;
		break;
	case ULTIMATE.SWIPE: //Oh wow, point blank and still missed
		ds_map[? ULTIMATE_MAP.NAME] = "Portal dimension";
		ds_map[? ULTIMATE_MAP.SCRIPT] = scUltimateSwipe;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 30;
		break;
	case ULTIMATE.SHIELD: //Huh, that exists
		ds_map[? ULTIMATE_MAP.NAME] = "Youuuu shall not Passssss!";
		ds_map[? ULTIMATE_MAP.SCRIPT] = scUltimateShield;
		ds_map[? ULTIMATE_MAP.CAST_TIME] = 15;
		break;
}

enum ULTIMATE {
	DEFAULT, LASERS, FAST, SAND, REVERSE, SWIPE, SHIELD,
	
	//PUT LAST
	LENGTH
}

enum ULTIMATE_MAP {
	NAME, SCRIPT, CAST_TIME
}