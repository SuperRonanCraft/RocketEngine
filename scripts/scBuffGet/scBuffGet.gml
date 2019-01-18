/// @desc Get the default map of a Buff
/// @arg buff-type you want to grab
/// @arg ds_map to add buffs to;

var buff = argument0;
var ds_map = argument1;
switch (buff) {
	case BUFFTYPE.BURNRUSH:
		ds_map[? BUFF_MAP.NAME] = "Burn Rush";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Ahhh! It Burns!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.BURNRUSH;
		ds_map[? BUFF_MAP.STEP] = scBuffBurnRush;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SMOKE1];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SMOKE1];
		ds_map[? BUFF_MAP.TIME] = 5 * room_speed;
		break;
	case BUFFTYPE.CHILLED:
		ds_map[? BUFF_MAP.NAME] = "Chilled";
		ds_map[? BUFF_MAP.DESCRIPTION] = "This snow is thick!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.CHILLED;
		ds_map[? BUFF_MAP.STEP] = scBuffChilled;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.WINTER];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.WINTER];
		ds_map[? BUFF_MAP.TIME] = 5 * room_speed;
		break;
	case BUFFTYPE.COOLDOWN:
		ds_map[? BUFF_MAP.NAME] = "Rocket Booster";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Shoot faster John!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.COOLDOWN;
		ds_map[? BUFF_MAP.STEP] = scBuffCooldown;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SPARKLE];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SPARKLE];
		ds_map[? BUFF_MAP.GOOD] = true;
		ds_map[? BUFF_MAP.TIME] = 8 * room_speed;
		break;
	case BUFFTYPE.SLIME:
		ds_map[? BUFF_MAP.NAME] = "Slimed";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Knees spaghetti";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.SLIME; 
		ds_map[? BUFF_MAP.STEP] = scBuffSlime; 
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SLIME];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SLIME];
		ds_map[? BUFF_MAP.TIME] = 4 * room_speed;
		break;
	case BUFFTYPE.SPEED:
		ds_map[? BUFF_MAP.NAME] = "Speed";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Gotta go fast!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.SPEED;
		ds_map[? BUFF_MAP.STEP] = scBuffSpeed;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SPEED];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SPEED];
		ds_map[? BUFF_MAP.GOOD] = true;
		ds_map[? BUFF_MAP.TIME] = 8 * room_speed;
		break;
	case BUFFTYPE.LOWGRAVITY:
		ds_map[? BUFF_MAP.NAME] = "Low Gravity";
		ds_map[? BUFF_MAP.DESCRIPTION] = "You're a Wizard!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.LOWGRAVITY;
		ds_map[? BUFF_MAP.STEP] = scBuffLowGravity;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.LOWGRAVITY];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.LOWGRAVITY];
		ds_map[? BUFF_MAP.GOOD] = true;
		ds_map[? BUFF_MAP.TIME] = 8 * room_speed;
		break;
	case BUFFTYPE.REVERSECONTROLS:
		ds_map[? BUFF_MAP.NAME] = "Reversed";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Not that way!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.REVERSECONTROLS;
		ds_map[? BUFF_MAP.STEP] = scBuffReverseControls;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.REVERSECONTROLS];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.REVERSECONTROLS];
		ds_map[? BUFF_MAP.TIME] = 5 * room_speed;
		break;
	case BUFFTYPE.ULTCHARGE:
		ds_map[? BUFF_MAP.NAME] = "Ultimate Booster";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Unlimited powahhh!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.ULTCHARGE;
		ds_map[? BUFF_MAP.STEP] = scBuffUltCharge;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.ULTCHARGE];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.ULTCHARGE];
		ds_map[? BUFF_MAP.GOOD] = true;
		ds_map[? BUFF_MAP.TIME] = 20 * room_speed;
		ds_map[? "multiplier"] = 10; //Custom ultimate booster variable
		break;
	case BUFFTYPE.BLEEDOUT:
		ds_map[? BUFF_MAP.NAME] = "Bleed Out";
		ds_map[? BUFF_MAP.DESCRIPTION] = "That's gonna hurt!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.BLEEDOUT;
		ds_map[? BUFF_MAP.STEP] = scBuffBleedout;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.BLEED];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.BLEED];
		ds_map[? BUFF_MAP.GOOD] = false;
		ds_map[? BUFF_MAP.STACKABLE] = true; //Only buff that is stackable (timer doesn't reset)
		ds_map[? BUFF_MAP.TIME] = 6 * room_speed;
		break;
	case BUFFTYPE.HACKED:
		ds_map[? BUFF_MAP.NAME] = "Hacked";
		ds_map[? BUFF_MAP.DESCRIPTION] = "'I forgot how to run'";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.HACKED;
		ds_map[? BUFF_MAP.STEP] = scBuffHacked;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.HACK];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.HACK];
		ds_map[? BUFF_MAP.GOOD] = false;
		ds_map[? BUFF_MAP.TIME] = 4 * room_speed;
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
	REVERSECONTROLS = s_abilityIcon_ReverseControls, ULTCHARGE = s_abilityIcon_UltCharge,
	KNOCKBACK = s_abilityIcon_KnockBack, BLEEDOUT = s_abilityIcon_BleedOut, HACKED = s_abilityIcon_Hacked
}

enum BUFFTYPE {
	BURNRUSH, CHILLED, COOLDOWN, SLIME, SPEED, LOWGRAVITY, REVERSECONTROLS, ULTCHARGE, BLEEDOUT, HACKED,
	
	//PUT LAST
	LENGHT
}