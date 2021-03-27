/// @desc load abilities
/// @arg ability-type you want to load
function scAbilityLoad(argument0) {

	var type = argument0;
	var ds_map = ability_map;

	switch (type) {
		case ABILITY_TYPE.NONE: //nuthing
			ds_map[? ABILITY_MAP.CAST_SCRIPT] = noone;
			break;
		case ABILITY_TYPE.CLONE: //Just a clone
			ds_map[? ABILITY_MAP.NAME] = "Pretty Guy";
			ds_map[? ABILITY_MAP.CAST_SCRIPT] = scUltimateClone;
			ds_map[? ABILITY_MAP.COOLDOWN] = 8;
			ds_map[? ABILITY_MAP.SPRITE] = s_ability_clone;
			break;
		case ABILITY_TYPE.BIGROCKET: //Just a big rocket
			ds_map[? ABILITY_MAP.NAME] = "Pure Chaos";
			ds_map[? ABILITY_MAP.CAST_SCRIPT] = scUltimateDefault;
			ds_map[? ABILITY_MAP.COOLDOWN] = 12;
			ds_map[? ABILITY_MAP.SPRITE] = s_ability_bigrocket;
			break;
		case ABILITY_TYPE.PORTAL: //Dodge the lasers!
			ds_map[? ABILITY_MAP.NAME] = "Termination";
			ds_map[? ABILITY_MAP.CAST_SCRIPT] = scAbilityPortal;
			ds_map[? ABILITY_MAP.COOLDOWN] = 20;
			ds_map[? ABILITY_MAP.SPRITE] = s_ability_portal;
			break;
		case ABILITY_TYPE.SMOKE_CLOUD: //Hidden in plain sight
			ds_map[? ABILITY_MAP.NAME] = "Smoke Cloud";
			ds_map[? ABILITY_MAP.CAST_SCRIPT] = scAbilitySmokeCloud;
			ds_map[? ABILITY_MAP.COOLDOWN] = 30;
			ds_map[? ABILITY_MAP.SPRITE] = s_ability_invis;
			break;
		case ABILITY_TYPE.BLOCK: //Just a block.
			ds_map[? ABILITY_MAP.NAME] = "Blocked";
			ds_map[? ABILITY_MAP.CAST_SCRIPT] = scAbilityBlock;
			ds_map[? ABILITY_MAP.COOLDOWN] = 0.5;
			ds_map[? ABILITY_MAP.SPRITE] = sWall;
			break;
		case ABILITY_TYPE.SPRAY: //Triple threat!
			ds_map[? ABILITY_MAP.NAME] = "Angry Bird!";
			ds_map[? ABILITY_MAP.CAST_SCRIPT] = scUltimateClone;
			ds_map[? ABILITY_MAP.COOLDOWN] = 12;
			ds_map[? "amt"] = 8; //amount of rockets in 90 degree cone
			break;
		
		case ABILITY_TYPE.REFLECT:
			ds_map[? ABILITY_MAP.NAME] = "Slice and dice!";
			ds_map[? ABILITY_MAP.CAST_SCRIPT] = scUltimateSwordDefault;
			ds_map[? ABILITY_MAP.COOLDOWN] = 3;
			ds_map[? ABILITY_MAP.SPRITE] = s_ability_reflect;
			break;
	}

	enum ABILITY_TYPE {
		CLONE, PORTAL, SPRAY,BLOCK,SMOKE_CLOUD,REFLECT,BIGROCKET,
		NONE
	}


}
