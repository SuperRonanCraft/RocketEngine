/// @desc load abilities
/// @arg ability-type you want to load

var type = argument0;
var ds_map = ability_map;

switch (type) {
	case ABILITY_TYPE.NONE: //nuthing
		ds_map[? ABILITY_MAP.CAST_SCRIPT] = noone;
		break;
	case ABILITY_TYPE.CLONE: //Huge af cloned rocket
		ds_map[? ABILITY_MAP.NAME] = "Mr.Huge!";
		ds_map[? ABILITY_MAP.CAST_SCRIPT] = scUltimateClone;
		ds_map[? ABILITY_MAP.COOLDOWN] = 6;
		break;
	case ABILITY_TYPE.PORTAL: //Dodge the lasers!
		ds_map[? ABILITY_MAP.NAME] = "Termination";
		ds_map[? ABILITY_MAP.CAST_SCRIPT] = scAbilityPortal;
		ds_map[? ABILITY_MAP.COOLDOWN] = 20;
		ds_map[? ABILITY_MAP.SPRITE] = s_ability_portal;
		break;
	case ABILITY_TYPE.SPRAY: //Triple threat!
		ds_map[? ABILITY_MAP.NAME] = "Angry Bird!";
		ds_map[? ABILITY_MAP.CAST_SCRIPT] = scUltimateClone;
		ds_map[? ABILITY_MAP.COOLDOWN] = 12;
		ds_map[? "amt"] = 8; //amount of rockets in 90 degree cone
		break;
}

enum ABILITY_TYPE {
	CLONE, PORTAL, SPRAY,
	NONE
}