/// @desc Add a buff type to a shootable
/// @arg buff-type
/// @arg target

var buff = argument0;
var targ = argument1;

var ds_map = ds_map_create();
//Defaults
ds_map[? "clock"] = 0;
ds_map[? "time"] = 5 * game_get_speed(gamespeed_fps);
ds_map[? "type"] = buff;

switch (buff) {
	case BUFFTYPE.BURNRUSH:
		ds_map[? "name"] = "Burn Rush";
		ds_map[? "stackable"] = false;
		ds_map[? "icon"] = s_abilityIcon_BurnRush;
		ds_map[? "step"] = scBuffBurnRush;
		ds_map[? "particle"] = oParticleHandler.ds_part[? PARTICLES.SMOKE1];
		break;
	case BUFFTYPE.CHILLED:
		ds_map[? "name"] = "Chilled";
		ds_map[? "stackable"] = false;
		ds_map[? "icon"] = s_abilityIcon_Chilled;
		ds_map[? "step"] = scBuffChilled;
		ds_map[? "particle"] = oParticleHandler.ds_part[? PARTICLES.WINTER];
		break;
}

if(!ds_map[? "stackable"] && !scFindBuff(targ.buffs, buff)){
	ds_list_add(targ.buffs, ds_map);
}

enum BUFFTYPE {
	BURNRUSH, CHILLED
}