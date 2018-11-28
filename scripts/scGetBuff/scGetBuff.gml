/// @desc Get the default map of a Buff
/// @arg buff-type you want to grab
/// @arg ds_map to add buffs to;

var buff = argument0;
var ds_map = argument1;
switch (buff) {
	case BUFFTYPE.BURNRUSH:
		ds_map[? "name"] = "Burn Rush";
		ds_map[? "description"] = "Run  bro!";
		ds_map[? "icon"] = s_abilityIcon_BurnRush;
		ds_map[? "step"] = scBuffBurnRush;
		ds_map[? "particle"] = oParticleHandler.ds_part[? PARTICLES.SMOKE1];
		break;
	case BUFFTYPE.CHILLED:
		ds_map[? "name"] = "Chilled";
		ds_map[? "description"] = "It's  still  cold";
		ds_map[? "icon"] = s_abilityIcon_Chilled;
		ds_map[? "step"] = scBuffChilled;
		ds_map[? "particle"] = oParticleHandler.ds_part[? PARTICLES.WINTER];
		break;
	case BUFFTYPE.COOLDOWN:
		ds_map[? "name"] = "Cooldowns";
		ds_map[? "description"] = "You  are  high!";
		ds_map[? "icon"] = s_abilityIcon_Cooldown;
		ds_map[? "step"] = scBuffCooldown;
		ds_map[? "particle"] = oParticleHandler.ds_part[? PARTICLES.SPARKLE];
		break;
	case BUFFTYPE.SLIME:
		ds_map[? "name"] = "Slimed";
		ds_map[? "description"] = "Knees  spaghetti";
		ds_map[? "icon"] = s_abilityIcon_Slimed; 
		ds_map[? "step"] = scBuffSlime; 
		ds_map[? "particle"] = oParticleHandler.ds_part[? PARTICLES.SLIME];
		break;
}