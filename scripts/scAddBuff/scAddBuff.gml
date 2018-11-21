/// @desc Add a buff type to a shootable
/// @arg buff-type
/// @arg target
/// @arg time of buff
/// @arg stackable buffs

var buffs = argument[0];
var targ = argument[1];
var time = 5;
if (argument_count > 2)
	time = argument[2];
var stackable = false;
if (argument_count > 3)
	stackable = argument[3];

//Defaults
for (var i = 0; i < array_length_1d(buffs); i++) {
	var ds_map = ds_map_create();
	ds_map[? "clock"] = 0;
	ds_map[? "time"] = time * game_get_speed(gamespeed_fps);
	ds_map[? "type"] = buffs[i];
	ds_map[? "stackable"] = stackable;
	switch (buffs[i]) {
		case BUFFTYPE.BURNRUSH:
			ds_map[? "name"] = "Burn Rush";
			ds_map[? "icon"] = s_abilityIcon_BurnRush;
			ds_map[? "step"] = scBuffBurnRush;
			ds_map[? "particle"] = oParticleHandler.ds_part[? PARTICLES.SMOKE1];
			break;
		case BUFFTYPE.CHILLED:
			ds_map[? "name"] = "Chilled";
			ds_map[? "icon"] = s_abilityIcon_Chilled;
			ds_map[? "step"] = scBuffChilled;
			ds_map[? "particle"] = oParticleHandler.ds_part[? PARTICLES.WINTER];
			break;
		case BUFFTYPE.COOLDOWN:
			ds_map[? "name"] = "Cooldowns";
			ds_map[? "icon"] = s_abilityIcon_Cooldown;
			ds_map[? "step"] = scBuffCooldown;
			ds_map[? "particle"] = oParticleHandler.ds_part[? PARTICLES.SPARKLE];
			break;
	}

	if(!ds_map[? "stackable"] && !scFindBuff(targ.buffs, buffs[i])){
		ds_list_add(targ.buffs, ds_map);
	}
}

enum BUFFTYPE {
	BURNRUSH, CHILLED, COOLDOWN
}