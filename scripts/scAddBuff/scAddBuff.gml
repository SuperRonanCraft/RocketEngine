/// @desc Add a buff type to a shootable
/// @arg buff-type
/// @arg target
/// @arg time of buff
/// @arg stackable buff

var buff = argument[0];
var targ = argument[1];
var time = 5;
if (argument_count > 2)
	time = argument[2];
var stackable = false;
if (argument_count > 3)
	stackable = argument[3];

//Add all buffs that were given
for (var i = 0; i < array_length_1d(buff); i++) {
	var ds_map = ds_map_create();
	ds_map[? "clock"] = 0;
	ds_map[? "time"] = time * game_get_speed(gamespeed_fps);
	ds_map[? "type"] = buff[i];
	ds_map[? "stackable"] = stackable;
	switch (buff[i]) {
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
		case BUFFTYPE.SLIME:
			ds_map[? "name"] = "Slimed";
			ds_map[? "icon"] = s_abilityIcon_Slimed; 
			ds_map[? "step"] = scbufflime; 
			ds_map[? "particle"] = oParticleHandler.ds_part[? PARTICLES.SLIME];
			break;
	}
	//Check if a buff from the target is the same TYPE, if so, delete it syncronously
	if (scFindBuff(targ, ds_map[? "type"])) {
		var listof = ds_list_create();
		//Find the buffs
		for (var b = 0; b < ds_list_size(targ.buffs); b++) {
			var currentbuff = targ.buffs[| b];
			if (currentbuff[? "type"] == ds_map[? "type"])
				ds_list_add(listof, currentbuff);
		}
		//Delete the buffs
		for (var a = 0; a < ds_map_size(listof); a++)
			scRemoveBuff(targ, listof[| a]);
		ds_list_destroy(listof);
	}
	//if(!ds_map[? "stackable"])
	ds_list_add(targ.buffs, ds_map);
}

enum BUFFTYPE {
	BURNRUSH, CHILLED, COOLDOWN, SLIME
}