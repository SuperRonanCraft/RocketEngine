/// @desc Get the default map of a Buff
/// @arg buff-type you want to grab
/// @arg ds_map to add buffs to;

var buff = argument0;
var ds_map = argument1;
//DEFAULTS
ds_map[? BUFF_MAP.NAME] = "Name"; //REQUIRED
ds_map[? BUFF_MAP.DESCRIPTION] = "Description"; //REQUIRED
ds_map[? BUFF_MAP.ICON] = BUFF_ICON.BURNRUSH; //REQUIRED
ds_map[? BUFF_MAP.TIME] = 5 * room_speed; //5 seconds uptime by default (noone for infinite)
//OPTIONAL
ds_map[? BUFF_MAP.DRAW] = noone;
ds_map[? BUFF_MAP.DRAW_GUI_BELOW] = noone;
ds_map[? BUFF_MAP.DRAW_GUI_ABOVE] = noone;
ds_map[? BUFF_MAP.STEP] = noone;
ds_map[? BUFF_MAP.DAMAGE_APPLIED] = noone;
ds_map[? BUFF_MAP.DAMAGE_TAKEN] = noone;
switch (buff) {
	case BUFFTYPE.BURNRUSH:
		ds_map[? BUFF_MAP.NAME] = "Burn Rush";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Ahhh! It Burns!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.BURNRUSH;
		ds_map[? BUFF_MAP.STEP] = scBuffBurnRush;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SMOKE1];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SMOKE1];
		ds_map[? BUFF_MAP.TIME] = 5 * room_speed;
		ds_map[? "damage_cd"] = ds_map[? BUFF_MAP.TIME] / 3; //cooldown for taking damage
		ds_map[? "damage_crt"] = ds_map[? "damage_cd"];
		ds_map[? "damage"] = 1; //damage to take
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
		ds_map[? BUFF_MAP.NAME] = "Cooldowns";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Shoot faster John!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.COOLDOWN;
		ds_map[? BUFF_MAP.STEP] = scBuffCooldown;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SPARKLE];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SPARKLE];
		ds_map[? BUFF_MAP.GOOD] = true;
		ds_map[? BUFF_MAP.TIME] = 4 * room_speed;
		break;
	case BUFFTYPE.SLIME:
		ds_map[? BUFF_MAP.NAME] = "Slimed";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Knees spaghetti";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.SLIME; 
		ds_map[? BUFF_MAP.STEP] = scBuffSlime; 
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SLIME];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SLIME];
		ds_map[? BUFF_MAP.TIME] = 5 * room_speed;
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
		ds_map[? BUFF_MAP.TIME] = 7 * room_speed;
		break;
	case BUFFTYPE.REVERSECONTROLS:
		ds_map[? BUFF_MAP.NAME] = "Reversed";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Not that way!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.REVERSECONTROLS;
		ds_map[? BUFF_MAP.STEP] = scBuffReverseControls;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.REVERSECONTROLS];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.REVERSECONTROLS];
		ds_map[? BUFF_MAP.TIME] = 3 * room_speed;
		break;
	case BUFFTYPE.ULTCHARGE:
		ds_map[? BUFF_MAP.NAME] = "Ultimate Boost";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Unlimited powahhh!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.ULTCHARGE;
		ds_map[? BUFF_MAP.STEP] = scBuffUltCharge;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.ULTCHARGE];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.ULTCHARGE];
		ds_map[? BUFF_MAP.GOOD] = true;
		ds_map[? BUFF_MAP.TIME] = 6 * room_speed;
		ds_map[? "multiplier"] = 8; //Custom ultimate booster variable
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
		ds_map[? BUFF_MAP.TIME] = 4 * room_speed;
		break;
	case BUFFTYPE.HACKED:
		ds_map[? BUFF_MAP.NAME] = "Hacked";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Forgot how to shoot?";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.HACKED;
		ds_map[? BUFF_MAP.STEP] = scBuffHacked;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.HACK];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.HACK];
		ds_map[? BUFF_MAP.GOOD] = false;
		ds_map[? BUFF_MAP.TIME] = 2 * room_speed;
		break;
	case BUFFTYPE.REVERSEGRAVITY:
		ds_map[? BUFF_MAP.NAME] = "Flipped";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Defying gravity";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.REVERSEGRAVITY;
		ds_map[? BUFF_MAP.STEP] = scBuffReverseGravity;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.REVERSEGRAVITY];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.REVERSEGRAVITY];
		ds_map[? BUFF_MAP.GOOD] = false;
		ds_map[? BUFF_MAP.TIME] = 3 * room_speed;
		break;
	/*case BUFFTYPE.KNOCKBACK:
		ds_map[? BUFF_MAP.NAME] = "Knockback";
		ds_map[? BUFF_MAP.DESCRIPTION] = "My back hurts!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.KNOCKBACK;
		ds_map[? BUFF_MAP.STEP] = scBuffKnockback;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.KBSMOKE];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.KBSMOKE];
		ds_map[? BUFF_MAP.GOOD] = false;
		ds_map[? BUFF_MAP.TIME] = 8 * room_speed;
		ds_map[? "multiplier"] = 2.2; //Amount of knockback to multiply
		break;*/
	case BUFFTYPE.ROCKETBOOTS:
		ds_map[? BUFF_MAP.NAME] = "Broken Boots";
		ds_map[? BUFF_MAP.DESCRIPTION] = "My shoes are broken!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.ROCKETBOOTS;
		ds_map[? BUFF_MAP.STEP] = scBuffRocketBoots;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.KBSMOKE];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.KBSMOKE];
		ds_map[? BUFF_MAP.GOOD] = false;
		ds_map[? BUFF_MAP.TIME] = 6 * room_speed;
		ds_map[? "vsp"] = 1.1; //Amount of vsp to add to the player
		ds_map[? "delay"] = 24 * TIME_SPEED; //Delay between force
		ds_map[? "current_delay"] = 0;
		ds_map[? "duration"] = 15 * TIME_SPEED; //Amount of time to apply force
		ds_map[? "current_duration"] = 0;
		break;
	case BUFFTYPE.SLOWMO:
		ds_map[? BUFF_MAP.NAME] = "Slowmo";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Another Dimension!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.SLOWMO;
		ds_map[? BUFF_MAP.STEP] = scBuffSlowmo;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SLOWMO];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SLOWMO];
		ds_map[? BUFF_MAP.GOOD] = false;
		ds_map[? BUFF_MAP.TIME] = 10 * room_speed;
		ds_map[? BUFF_MAP.DRAW] = scBuffSlowmo_Draw;
		ds_map[? "dialation"] = 0.5; //How much to dialate time down to
		ds_map[? "steps"] = ds_list_create();
		ds_map[? "steps_amt"] = 3;
		ds_map[? "steps_crt"] = 0;
		ds_map[? "steps_on"] = 0;
		ds_map[? "steps_max"] = 7;
		break;
	case BUFFTYPE.SLEEP:
		ds_map[? BUFF_MAP.NAME] = "Sleep";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Night Night";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.SLEEP;
		ds_map[? BUFF_MAP.STEP] = scBuffSleep;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SLEEP];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SLEEP];
		ds_map[? BUFF_MAP.GOOD] = false;
		ds_map[? BUFF_MAP.TIME] = 3 * room_speed;
		ds_map[? "parts_crt"] = 0;
		ds_map[? "parts_amt"] = 5;
		break;
	case BUFFTYPE.DAMAGE:
		ds_map[? BUFF_MAP.NAME] = "Double Damage";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Skull piercing!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.DAMAGE;
		ds_map[? BUFF_MAP.STEP] = scBuffDamage;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.DAMAGE];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.DAMAGE];
		ds_map[? BUFF_MAP.GOOD] = true;
		ds_map[? BUFF_MAP.TIME] = 5 * room_speed;
		ds_map[? "parts_crt"] = 0;
		ds_map[? "parts_amt"] = 8;
		break;
	case BUFFTYPE.ANTIHEAL:
		ds_map[? BUFF_MAP.NAME] = "Anti-Healing";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Why can't I heal!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.ANTIHEAL;
		ds_map[? BUFF_MAP.DRAW_GUI_BELOW] = scBuffAntiHeal;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.ANTIHEAL];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.ANTIHEAL];
		ds_map[? BUFF_MAP.GOOD] = false;
		ds_map[? BUFF_MAP.TIME] = 12 * room_speed;
		ds_map[? "color"] = c_purple;
		ds_map[? "alpha"] = 0.8;
		ds_map[? "scale_org"] = 0.3;
		ds_map[? "scale_lmt"] = 0.1;
		ds_map[? "scale_chg"] = 0.01;
		ds_map[? "scale_dir"] = 1;
		ds_map[? "scale"] = ds_map[? "scale_org"];
		break;
	case BUFFTYPE.ABSORBTION:
		ds_map[? BUFF_MAP.NAME] = "Absorbtion";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Armor up baby!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.ABSORBTION;
		ds_map[? BUFF_MAP.DRAW_GUI_BELOW] = scBuffAbsorbtion;
		ds_map[? BUFF_MAP.DRAW] = scBuffAbsorbtion_Draw;
		ds_map[? BUFF_MAP.DAMAGE_TAKEN] = scBuffAbsorbtion_Damage;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.ABSORBTION];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.ABSORBTION];
		ds_map[? BUFF_MAP.GOOD] = true;
		ds_map[? BUFF_MAP.TIME] = 12 * room_speed;
		ds_map[? BUFF_MAP.STACKABLE] = true;
		ds_map[? "health"] = 4;
		ds_map[? "parts_crt"] = 0;
		ds_map[? "parts_amt"] = 5;
		break;
	case BUFFTYPE.LIFESTEAL:
		ds_map[? BUFF_MAP.NAME] = "Life-Steal";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Give me your soul!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.LIFESTEAL;
		ds_map[? BUFF_MAP.DRAW_GUI_BELOW] = scBuffLifeSteal;
		ds_map[? BUFF_MAP.DAMAGE_APPLIED] = scBuffLifeSteal_Damage;
		ds_map[? BUFF_MAP.DRAW] = scBuffLifeSteal_Draw;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.LIFESTEAL];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.LIFESTEAL];
		ds_map[? BUFF_MAP.GOOD] = true;
		ds_map[? BUFF_MAP.TIME] = 10 * room_speed;
		ds_map[? "parts_crt"] = 0;
		ds_map[? "parts_amt"] = 6;
		break;
	// FOR LATER TECHNOLOGICAL ADVANCES
	/*case BUFFTYPE.CLEANSE:
		ds_map[? BUFF_MAP.NAME] = "Cleanse";
		ds_map[? BUFF_MAP.DESCRIPTION] = "Check yourself!";
		ds_map[? BUFF_MAP.ICON] = BUFF_ICON.CLEANSE;
		ds_map[? BUFF_MAP.STEP] = scBuffCleanse;
		ds_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.CLEANSE];
		ds_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.CLEANSE];
		ds_map[? BUFF_MAP.GOOD] = true;
		ds_map[? BUFF_MAP.TIME] = 12 * room_speed;
		ds_map[? BUFF_MAP.STACKABLE] = true;
		ds_map[? "parts_crt"] = 0;
		ds_map[? "parts_amt"] = 4;
		break;*/
}
ds_map[? BUFF_MAP.TYPE] = buff;

enum BUFF_MAP {
	NAME, DESCRIPTION, ICON, PARTICLE, PARTICLE_AMT,
	//SCRIPTS
	STEP, DRAW, DRAW_GUI_BELOW, DRAW_GUI_ABOVE, DAMAGE_APPLIED, DAMAGE_TAKEN,
	//GENERAL
	CLOCK, TIME, TYPE, STACKABLE, DISABLED, GOOD, GIVEN_BY
}

enum BUFF_ICON {
	BURNRUSH = s_abilityIcon_BurnRush, CHILLED = s_abilityIcon_Chilled,
	COOLDOWN = s_abilityIcon_Cooldown, SLIME = s_abilityIcon_Slimed,
	SPEED = s_abilityIcon_Speed, LOWGRAVITY = s_abilityIcon_LowGravity,
	REVERSECONTROLS = s_abilityIcon_ReverseControls, ULTCHARGE = s_abilityIcon_UltCharge,
	BLEEDOUT = s_abilityIcon_BleedOut, HACKED = s_abilityIcon_Hacked,
	REVERSEGRAVITY = s_abilityIcon_ReverseGravity, ROCKETBOOTS = s_abilityIcon_RocketBoots,
	SLOWMO = s_abilityIcon_Slowmo, SLEEP = s_abilityIcon_Sleep, DAMAGE = s_abilityIcon_Damage,
	ANTIHEAL = s_abilityIcon_AntiHeal, ABSORBTION = s_abilityIcon_Absorbtion,
	LIFESTEAL = s_abilityIcon_LifeSteal, CLEANSE = s_abilityIcon_Cleanse
}

enum BUFFTYPE {
	BURNRUSH, CHILLED, COOLDOWN, SLIME, SPEED, LOWGRAVITY, 
	REVERSECONTROLS, ULTCHARGE, BLEEDOUT, HACKED,
	REVERSEGRAVITY, ROCKETBOOTS, SLOWMO, SLEEP, DAMAGE,
	ANTIHEAL, ABSORBTION, LIFESTEAL, //CLEANSE,
	
	//PUT LAST
	LENGHT
}