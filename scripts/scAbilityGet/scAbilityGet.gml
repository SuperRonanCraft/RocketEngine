/// @desc get the ability ds map
/// @arg ability-type you want to load

var type = argument0;
var ds_map = ability_map;

//Defaults
ds_map[? ABILITY_MAP.COOLDOWN] = 6;

switch (type) {
	case ABILITY_TYPE.NONE: //nuthing
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = noone;
		break;
	case ABILITY_TYPE.DEFAULT: //Huge af cloned rocket
		ds_map[? ULTIMATE_MAP.NAME] = "Mr.Huge!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateDefault;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateLaser_Draw;
		break;
	case ABILITY_TYPE.BARRAGE: //Dodge the lasers!
		ds_map[? ULTIMATE_MAP.NAME] = "Termination";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateBarrage;
		break;
	case ABILITY_TYPE.SPRAY: //Triple threat!
		ds_map[? ULTIMATE_MAP.NAME] = "Angry Bird!";
		ds_map[? ULTIMATE_MAP.CASTED_SCRIPT] = scUltimateSpray;
		ds_map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW] = scUltimateSpray_Draw;
		ds_map[? "amt"] = 8; //amount of rockets in 90 degree cone
		break;
}

enum ABILITY_TYPE {
	DEFAULT, BARRAGE, SPRAY,
	NONE
}