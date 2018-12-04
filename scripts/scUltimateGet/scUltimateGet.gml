/// @desc get the ultimate ds map
/// @arg ultimate-type you want to grab
/// @arg ds_map you want to copy to

var type = argument0;
var ds_map = argument1;

switch (type) {
	case ULTIMATE.DEFAULT:
		ds_map[? ULTIMATE_MAP.NAME] = "Rockets Brigade";
		ds_map[? ULTIMATE_MAP.DESCRIPTION] = "JUSTICE  RAINS  FROM  ABOVE!";
		break;
}

enum ULTIMATE {
	DEFAULT,
	
	//PUT LAST
	LENGTH
}

enum ULTIMATE_MAP {
	NAME, DESCRIPTION, TYPE, OBJECT
}