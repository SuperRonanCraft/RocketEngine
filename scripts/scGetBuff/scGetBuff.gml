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
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SMOKE1];
		break;
	case BUFFTYPE.CHILLED:
		ds_map[? BUFF_MAP.NAME] = "Chilled";
		ds_map[? BUFF_MAP.DESCRIPTION] = "It's  still  cold";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.CHILLED;
		ds_map[? BUFF_MAP.STEP] = scBuffChilled;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.WINTER];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.WINTER];
		break;
	case BUFFTYPE.COOLDOWN:
		ds_map[? BUFF_MAP.NAME] = "Cooldowns";
		ds_map[? BUFF_MAP.DESCRIPTION] = "You  are  high!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.COOLDOWN;
		ds_map[? BUFF_MAP.STEP] = scBuffCooldown;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SPARKLE];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SPARKLE];
		ds_map[? BUFF_MAP.GOOD] = true;
		break;
	case BUFFTYPE.SLIME:
		ds_map[? BUFF_MAP.NAME] = "Slimed";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Knees  spaghetti";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.SLIME; 
		ds_map[? BUFF_MAP.STEP] = scBuffSlime; 
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SLIME];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SLIME];
		break;
	case BUFFTYPE.SPEED:
		ds_map[? BUFF_MAP.NAME] = "Speed";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Gotta  go  fast!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.SPEED;
		ds_map[? BUFF_MAP.STEP] = scBuffSpeed;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SPEED];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SPEED];
		ds_map[? BUFF_MAP.GOOD] = true;
		break;
	case BUFFTYPE.LOWGRAVITY:
		ds_map[? BUFF_MAP.NAME] = "No  Gravity";
		ds_map[? BUFF_MAP.DESCRIPTION] = "You're  a  Wizard!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.LOWGRAVITY;
		ds_map[? BUFF_MAP.STEP] = scBuffLowGravity;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.LOWGRAVITY];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.LOWGRAVITY];
		ds_map[? BUFF_MAP.GOOD] = true;
		break;
	case BUFFTYPE.REVERSECONTROLS:
		ds_map[? BUFF_MAP.NAME] = "Reversed";
		ds_map[? BUFF_MAP.DESCRIPTION] = "You  have  no  power!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.REVERSECONTROLS;
		ds_map[? BUFF_MAP.STEP] = scBuffReverseControls;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.REVERSECONTROLS];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.REVERSECONTROLS];
		break;
	case BUFFTYPE.ULTCHARGE:
		ds_map[? BUFF_MAP.NAME] = "Ultimate Charger";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Unlimited powahhh!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.ULTCHARGE;
		ds_map[? BUFF_MAP.STEP] = scBuffUltCharge;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.ULTCHARGE];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.ULTCHARGE];
		ds_map[? BUFF_MAP.GOOD] = true;
		ds_map[? BUFF_MAP.TIME] = 15 * room_speed;
		ds_map[? "multiplier"] = 0.5;
		break;
}
ds_map[? BUFF_MAP.TYPE] = buff;

enum BUFF_MAP {
	NAME, DESCRIPTION, ICON, PARTICLE, PARTICLE_AMT,
	//SCRIPTS
	STEP,
	//GENERAL
	CLOCK, TIME, TYPE, STACKABLE, DISABLED, GOOD
}

enum BUFF_ICON {
	BURNRUSH = s_abilityIcon_BurnRush, CHILLED = s_abilityIcon_Chilled,
	COOLDOWN = s_abilityIcon_Cooldown, SLIME = s_abilityIcon_Slimed,
	SPEED = s_abilityIcon_Speed, LOWGRAVITY = s_abilityIcon_LowGravity,
	REVERSECONTROLS = s_abilityIcon_ReverseControls, ULTCHARGE = s_abilityIcon_UltCharge
}

enum BUFFTYPE {
	BURNRUSH, CHILLED, COOLDOWN, SLIME, SPEED, LOWGRAVITY, REVERSECONTROLS, ULTCHARGE,
	
	//PUT LAST
	LENGHT
}