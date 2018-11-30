/// @desc Get the default map of a Buff
/// @arg buff-type you want to grab
/// @arg ds_map to add buffs to;

var buff = argument0;
var ds_map = argument1;
switch (buff) {
	case BUFFTYPE.BURNRUSH:
		ds_map[? BUFF_MAP.NAME] = "Burn  Rush";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Run  bro!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.BURNRUSH;
		ds_map[? BUFF_MAP.STEP] = scBuffBurnRush;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SMOKE1];
		ds_map[? BUFF_MAP.GOOD] = false;
		break;
	case BUFFTYPE.CHILLED:
		ds_map[? BUFF_MAP.NAME] = "Chilled";
		ds_map[? BUFF_MAP.DESCRIPTION] = "It's  still  cold";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.CHILLED;
		ds_map[? BUFF_MAP.STEP] = scBuffChilled;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.WINTER];
		ds_map[? BUFF_MAP.GOOD] = false;
		break;
	case BUFFTYPE.COOLDOWN:
		ds_map[? BUFF_MAP.NAME] = "Cooldowns";
		ds_map[? BUFF_MAP.DESCRIPTION] = "You  are  high!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.COOLDOWN;
		ds_map[? BUFF_MAP.STEP] = scBuffCooldown;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SPARKLE];
		ds_map[? BUFF_MAP.GOOD] = true;
		break;
	case BUFFTYPE.SLIME:
		ds_map[? BUFF_MAP.NAME] = "Slimed";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Knees  spaghetti";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.SLIME; 
		ds_map[? BUFF_MAP.STEP] = scBuffSlime; 
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SLIME];
		ds_map[? BUFF_MAP.GOOD] = false; 
		break;
}
ds_map[? BUFF_MAP.TYPE] = buff;

enum BUFF_MAP {
	NAME, DESCRIPTION, ICON, PARTICLE,
	//SCRIPTS
	STEP,
	//GENERAL
	CLOCK, TIME, TYPE, STACKABLE, DISABLED, GOOD
}

enum BUFF_ICON {
	BURNRUSH = s_abilityIcon_BurnRush, CHILLED = s_abilityIcon_Chilled, COOLDOWN = s_abilityIcon_Cooldown, SLIME = s_abilityIcon_Slimed
}

enum BUFFTYPE {
	BURNRUSH, CHILLED, COOLDOWN, SLIME,
	
	//PUT LAST
	LENGHT
}