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
}

enum ULTIMATE {
	DEFAULT, LASERS, FAST,
	
	//PUT LAST
	LENGTH
}

enum ULTIMATE_MAP {
	NAME, SCRIPT, CAST_TIME
}