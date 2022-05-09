/// @desc Get the default map of a Buff
/// @arg buff-type you want to grab
/// @arg _map to add buffs to;
function scBuffGet(argument0, argument1) {

	var buff = argument0;
	var _map = argument1;
	//DEFAULTS
	_map[? BUFF_MAP.NAME] = "Name"; //REQUIRED
	_map[? BUFF_MAP.DESCRIPTION] = "Description"; //REQUIRED
	_map[? BUFF_MAP.ICON] = BUFF_ICON.BURNRUSH; //REQUIRED
	_map[? BUFF_MAP.TIME] = 5 * room_speed; //5 seconds uptime by default (noone for infinite)
	_map[? BUFF_MAP.CLOCK] = 0;
	_map[? BUFF_MAP.STACK_INFO] = [BUFF_STACK_TYPE.NONE];
	_map[? BUFF_MAP.ENABLED] = true;
	_map[? BUFF_MAP.GOOD] = true;
	_map[? BUFF_MAP.GIVEN_BY] = noone;
	//OPTIONAL
	_map[? BUFF_MAP.PARTICLE] = noone;
	_map[? BUFF_MAP.PARTICLE_AMT] = 1;
	_map[? BUFF_MAP.DRAW] = noone;
	_map[? BUFF_MAP.DRAW_GUI_BELOW] = noone;
	_map[? BUFF_MAP.DRAW_GUI_ABOVE] = noone;
	_map[? BUFF_MAP.STEP] = noone;
	_map[? BUFF_MAP.DAMAGE_PREAPPLY] = noone;
	_map[? BUFF_MAP.DAMAGE_APPLIED] = noone;
	_map[? BUFF_MAP.DAMAGE_TAKEN] = noone;
	switch (buff) {
		case BUFFTYPE.BURNRUSH:
			_map[? BUFF_MAP.NAME] = "Burn Rush";
			_map[? BUFF_MAP.DESCRIPTION] = "Ahhh! It Burns!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.BURNRUSH;
			_map[? BUFF_MAP.STEP] = scBuffBurnRush;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SMOKE1];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SMOKE1];
			_map[? BUFF_MAP.TIME] = 5 * room_speed;
			_map[? "damage_cd"] = room_speed/2; //cooldown for taking damage
			_map[? "damage_crt"] = _map[? "damage_cd"];
			_map[? "damage"] = 1; //damage to take
			_map[? BUFF_MAP.GOOD] = false;
			break;
		case BUFFTYPE.CHILLED:
			_map[? BUFF_MAP.NAME] = "Chilled";
			_map[? BUFF_MAP.DESCRIPTION] = "This snow is thick!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.CHILLED;
			_map[? BUFF_MAP.STEP] = scBuffChilled;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.WINTER];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.WINTER];
			_map[? BUFF_MAP.TIME] = 5 * room_speed;
			_map[? BUFF_MAP.GOOD] = false;
			break;
		case BUFFTYPE.COOLDOWN:
			_map[? BUFF_MAP.NAME] = "Cooldowns";
			_map[? BUFF_MAP.DESCRIPTION] = "Shoot faster John!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.COOLDOWN;
			_map[? BUFF_MAP.STEP] = scBuffCooldown;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SPARKLE];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SPARKLE];
			_map[? BUFF_MAP.GOOD] = true;
			_map[? BUFF_MAP.TIME] = 4 * room_speed;
			break;
		case BUFFTYPE.SLIME:
			_map[? BUFF_MAP.NAME] = "Slimed";
			_map[? BUFF_MAP.DESCRIPTION] = "Knees spaghetti";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.SLIME; 
			_map[? BUFF_MAP.STEP] = scBuffSlime; 
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SLIME];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SLIME];
			_map[? BUFF_MAP.TIME] = 5 * room_speed;
			_map[? BUFF_MAP.GOOD] = false;
			break;
		case BUFFTYPE.SPEED:
			_map[? BUFF_MAP.NAME] = "Speed";
			_map[? BUFF_MAP.DESCRIPTION] = "Gotta go fast!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.SPEED;
			_map[? BUFF_MAP.STEP] = scBuffSpeed;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SPEED];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SPEED];
			_map[? BUFF_MAP.GOOD] = true;
			_map[? BUFF_MAP.TIME] = 8 * room_speed;
			break;
		case BUFFTYPE.LOWGRAVITY:
			_map[? BUFF_MAP.NAME] = "Low Gravity";
			_map[? BUFF_MAP.DESCRIPTION] = "You're a Wizard!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.LOWGRAVITY;
			_map[? BUFF_MAP.STEP] = scBuffLowGravity;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.LOWGRAVITY];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.LOWGRAVITY];
			_map[? BUFF_MAP.GOOD] = true;
			_map[? BUFF_MAP.TIME] = 7 * room_speed;
			break;
		case BUFFTYPE.REVERSECONTROLS:
			_map[? BUFF_MAP.NAME] = "Reversed";
			_map[? BUFF_MAP.DESCRIPTION] = "Not that way!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.REVERSECONTROLS;
			_map[? BUFF_MAP.STEP] = scBuffReverseControls;
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.REVERSECONTROLS];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.REVERSECONTROLS];
			_map[? BUFF_MAP.TIME] = 3 * room_speed;
			break;
		case BUFFTYPE.ULTCHARGE:
			_map[? BUFF_MAP.NAME] = "Ultimate Boost";
			_map[? BUFF_MAP.DESCRIPTION] = "Unlimited powahhh!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.ULTCHARGE;
			_map[? BUFF_MAP.STEP] = scBuffUltCharge;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.ULTCHARGE];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.ULTCHARGE];
			_map[? BUFF_MAP.GOOD] = true;
			_map[? BUFF_MAP.TIME] = 6 * room_speed;
			_map[? "multiplier"] = 8; //Custom ultimate booster variable
			break;
		case BUFFTYPE.BLEEDOUT:
			_map[? BUFF_MAP.NAME] = "Bleed Out";
			_map[? BUFF_MAP.DESCRIPTION] = "That's gonna hurt!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.BLEEDOUT;
			_map[? BUFF_MAP.STEP] = scBuffBleedout;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.BLEED];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.BLEED];
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.STACK_INFO] = [BUFF_STACK_TYPE.MULTIPLE];
			_map[? BUFF_MAP.TIME] = 4 * room_speed;
			break;
		case BUFFTYPE.HACKED:
			_map[? BUFF_MAP.NAME] = "Hacked";
			_map[? BUFF_MAP.DESCRIPTION] = "Forgot how to shoot?";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.HACKED;
			_map[? BUFF_MAP.STEP] = scBuffHacked;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.HACK];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.HACK];
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.TIME] = 2 * room_speed;
			break;
		case BUFFTYPE.REVERSEGRAVITY:
			_map[? BUFF_MAP.NAME] = "Flipped";
			_map[? BUFF_MAP.DESCRIPTION] = "Defying gravity";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.REVERSEGRAVITY;
			_map[? BUFF_MAP.STEP] = scBuffReverseGravity;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.REVERSEGRAVITY];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.REVERSEGRAVITY];
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.TIME] = 3 * room_speed;
			break;
		/*case BUFFTYPE.KNOCKBACK:
			_map[? BUFF_MAP.NAME] = "Knockback";
			_map[? BUFF_MAP.DESCRIPTION] = "My back hurts!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.KNOCKBACK;
			_map[? BUFF_MAP.STEP] = scBuffKnockback;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.KBSMOKE];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.KBSMOKE];
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.TIME] = 8 * room_speed;
			_map[? "multiplier"] = 2.2; //Amount of knockback to multiply
			break;*/
		case BUFFTYPE.ROCKETBOOTS:
			_map[? BUFF_MAP.NAME] = "Broken Boots";
			_map[? BUFF_MAP.DESCRIPTION] = "My shoes are broken!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.ROCKETBOOTS;
			_map[? BUFF_MAP.STEP] = scBuffRocketBoots;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.KBSMOKE];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.KBSMOKE];
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.TIME] = 6 * room_speed;
			_map[? "vsp"] = 1.1; //Amount of vsp to add to the player
			_map[? "delay"] = 24 * TIME_SPEED; //Delay between force
			_map[? "current_delay"] = 0;
			_map[? "duration"] = 15 * TIME_SPEED; //Amount of time to apply force
			_map[? "current_duration"] = 0;
			_map[? BUFF_MAP.ENABLED] = false;
			break;
		case BUFFTYPE.SLOWMO:
			_map[? BUFF_MAP.NAME] = "Slowmo";
			_map[? BUFF_MAP.DESCRIPTION] = "Another Dimension!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.SLOWMO;
			_map[? BUFF_MAP.STEP] = scBuffSlowmo;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SLOWMO];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SLOWMO];
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.TIME] = 2 * room_speed;
			_map[? BUFF_MAP.DRAW] = scBuffSlowmo_Draw;
			_map[? "dialation"] = 0.5; //How much to dialate time down to
			_map[? "steps"] = ds_list_create();
			_map[? "steps_amt"] = 3;
			_map[? "steps_crt"] = 0;
			_map[? "steps_on"] = 0;
			_map[? "steps_max"] = 7;
			break;
		case BUFFTYPE.SLEEP:
			_map[? BUFF_MAP.NAME] = "Sleep";
			_map[? BUFF_MAP.DESCRIPTION] = "Night Night";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.SLEEP;
			_map[? BUFF_MAP.STEP] = scBuffSleep;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SLEEP];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SLEEP];
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.TIME] = 3 * room_speed;
			_map[? "parts_crt"] = 0;
			_map[? "parts_amt"] = 5;
			break;
		case BUFFTYPE.DAMAGE:
			_map[? BUFF_MAP.NAME] = "Double Damage";
			_map[? BUFF_MAP.DESCRIPTION] = "Skull piercing!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.DAMAGE;
			_map[? BUFF_MAP.STEP] = scBuffDamage_Step;
			_map[? BUFF_MAP.DAMAGE_PREAPPLY] = scBuffDamage_PreApply;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.DAMAGE];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.DAMAGE];
			_map[? BUFF_MAP.GOOD] = true;
			_map[? BUFF_MAP.TIME] = 5 * room_speed;
			_map[? "parts_crt"] = 0;
			_map[? "parts_amt"] = 8;
			break;
		case BUFFTYPE.ANTIHEAL:
			_map[? BUFF_MAP.NAME] = "Anti-Healing";
			_map[? BUFF_MAP.DESCRIPTION] = "Why can't I heal!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.ANTIHEAL;
			_map[? BUFF_MAP.DRAW_GUI_BELOW] = scBuffAntiHeal;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.ANTIHEAL];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.ANTIHEAL];
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.TIME] = 12 * room_speed;
			//Type, combo-amount, combo-current, up-time, up-time-current, refreshable?
			//_map[? BUFF_MAP.STACK_INFO] = [BUFF_STACK_TYPE.COMBO, 5, 1, 3 * room_speed, 0];
			_map[? "color"] = c_purple;
			_map[? "alpha"] = 0.8;
			_map[? "scale_org"] = 0.3;
			_map[? "scale_lmt"] = 0.1;
			_map[? "scale_chg"] = 0.01;
			_map[? "scale_dir"] = 1;
			_map[? "scale"] = _map[? "scale_org"];
			break;
		case BUFFTYPE.ABSORBTION:
			_map[? BUFF_MAP.NAME] = "Absorbtion";
			_map[? BUFF_MAP.DESCRIPTION] = "Armor up baby!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.ABSORBTION;
			_map[? BUFF_MAP.DRAW_GUI_BELOW] = scBuffAbsorbtion;
			_map[? BUFF_MAP.DRAW] = scBuffAbsorbtion_Draw;
			_map[? BUFF_MAP.DAMAGE_TAKEN] = scBuffAbsorbtion_Damage;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.ABSORBTION];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.ABSORBTION];
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.TIME] = 12 * room_speed;
			_map[? BUFF_MAP.STACK_INFO] = [BUFF_STACK_TYPE.MULTIPLE];
			_map[? "health"] = 4;
			_map[? "parts_crt"] = 0;
			_map[? "parts_amt"] = 5;
			break;
		case BUFFTYPE.LIFESTEAL:
			_map[? BUFF_MAP.NAME] = "Life-Steal";
			_map[? BUFF_MAP.DESCRIPTION] = "Give me your soul!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.LIFESTEAL;
			_map[? BUFF_MAP.DRAW_GUI_BELOW] = scBuffLifeSteal;
			_map[? BUFF_MAP.DAMAGE_APPLIED] = scBuffLifeSteal_Damage;
			_map[? BUFF_MAP.DRAW] = scBuffLifeSteal_Draw;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.LIFESTEAL];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.LIFESTEAL];
			_map[? BUFF_MAP.GOOD] = true;
			_map[? BUFF_MAP.TIME] = 10 * room_speed;
			_map[? "parts_crt"] = 0;
			_map[? "parts_amt"] = 6;
			break;
		
		case BUFFTYPE.FROZEN:
			_map[? BUFF_MAP.NAME] = "Frozen";
			_map[? BUFF_MAP.DESCRIPTION] = "Snowman not included!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.FROZEN;
			_map[? BUFF_MAP.STEP] = scBuffFrozen; 
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.FROST];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.FROST];
			_map[? BUFF_MAP.TIME] = 2 * room_speed;
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.STACK_INFO] = [BUFF_STACK_TYPE.COMBO, 2, 1, 2 * room_speed, 0]; //Type, combo-amount, combo-current, up-time, up-time-current, refreshable?
			break;
		
		case BUFFTYPE.INVISIBLE:
			_map[? BUFF_MAP.NAME] = "Invisible";
			_map[? BUFF_MAP.DESCRIPTION] = "I swear they were here!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.INVISIBLE;
			_map[? BUFF_MAP.STEP] = scBuffInvisble; 
			//_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.FROST];
			//_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.FROST];
			_map[? BUFF_MAP.TIME] = 5 * room_speed;
			_map[? BUFF_MAP.GOOD] = true;
			break;
			
		/*
		case BUFFTYPE.FFA_DEBUFF:
			_map[? BUFF_MAP.NAME] = "Free For All";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.FFA;
			_map[? BUFF_MAP.STEP] = scBuffFFA;
			_map[? BUFF_MAP.TIME] = 3 * room_speed;
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.FFA];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.FFA];
			break;
		*/
		
		case BUFFTYPE.DOUSED:
			_map[? BUFF_MAP.NAME] = "Doused";
			_map[? BUFF_MAP.DESCRIPTION] = "Extremely flammable!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.DOUSED;
			_map[? BUFF_MAP.STEP] = scBuffDoused;
			_map[? BUFF_MAP.TIME] = 4 * room_speed;
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.DRIP1];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.DRIP1];
			_map[? BUFF_MAP.STACK_INFO] = [BUFF_STACK_TYPE.MULTIPLE];
			break;
			
		case BUFFTYPE.BURNING:
			_map[? BUFF_MAP.NAME] = "Burning!";
			_map[? BUFF_MAP.DESCRIPTION] = "You might want to look into that.";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.BURNRUSH;
			_map[? BUFF_MAP.STEP] = scBuffBurnDoT;
			_map[? BUFF_MAP.TIME] = 2 * room_speed;
			_map[? BUFF_MAP.GOOD] = false;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.FIRE1];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.FIRE2];
			_map[? "damage_cd"] = room_speed/4; //cooldown for taking damage
			_map[? "damage_crt"] = _map[? "damage_cd"];
			_map[? "damage"] = 3; //damage to take
			break;
			
		case BUFFTYPE.FASTMO:
			_map[? BUFF_MAP.NAME] = "Fastmo";
			_map[? BUFF_MAP.DESCRIPTION] = "So fast!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.FASTMO;
			_map[? BUFF_MAP.STEP] = scBuffFastmo;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SPEED];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SPEED];
			_map[? BUFF_MAP.GOOD] = true;
			_map[? BUFF_MAP.TIME] = 7 * room_speed;
			_map[? BUFF_MAP.DRAW] = scBuffSlowmo_Draw;
			_map[? "dialation"] = 2; //How much to dialate time to
			_map[? "steps"] = ds_list_create();
			_map[? "steps_amt"] = 3;
			_map[? "steps_crt"] = 0;
			_map[? "steps_on"] = 0;
			_map[? "steps_max"] = 7;
			break;
		// FOR LATER TECHNOLOGICAL ADVANCES
		/*case BUFFTYPE.CLEANSE:
			_map[? BUFF_MAP.NAME] = "Cleanse";
			_map[? BUFF_MAP.DESCRIPTION] = "Check yourself!";
			_map[? BUFF_MAP.ICON] = BUFF_ICON.CLEANSE;
			_map[? BUFF_MAP.STEP] = scBuffCleanse;
			_map[? BUFF_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.CLEANSE];
			_map[? BUFF_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.CLEANSE];
			_map[? BUFF_MAP.GOOD] = true;
			_map[? BUFF_MAP.TIME] = 12 * room_speed;
			_map[? BUFF_MAP.STACKABLE] = true;
			_map[? "parts_crt"] = 0;
			_map[? "parts_amt"] = 4;
			break;*/
	}
	_map[? BUFF_MAP.TYPE] = buff;

	enum BUFF_MAP {
		NAME, DESCRIPTION, ICON, PARTICLE, PARTICLE_AMT,
		//SCRIPTS
		STEP, DRAW, DRAW_GUI_BELOW, DRAW_GUI_ABOVE, DAMAGE_APPLIED, DAMAGE_TAKEN, DAMAGE_PREAPPLY,
		//GENERAL
		CLOCK, TIME, TYPE, ENABLED, GOOD, GIVEN_BY, 
		STACK_INFO, //stack type of buff
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
		LIFESTEAL = s_abilityIcon_LifeSteal, CLEANSE = s_abilityIcon_Cleanse,
		FROZEN = s_abilityIcon_Frozen, INVISIBLE = s_abilityIcon_Invisible,
		FFA = s_abilityIcon_FFA, DOUSED = s_abilityIcon_Doused, BURNING = s_abilityIcon_BurnRush,
		FASTMO = s_abilityIcon_RocketBoots,
	}

	enum BUFFTYPE {
		BURNRUSH, CHILLED, COOLDOWN, SLIME, SPEED, LOWGRAVITY, 
		REVERSECONTROLS, ULTCHARGE, BLEEDOUT, HACKED,
		REVERSEGRAVITY, ROCKETBOOTS, SLOWMO, SLEEP, DAMAGE,
		ANTIHEAL, ABSORBTION, LIFESTEAL, FROZEN, //FASTMO, //CLEANSE,
		INVISIBLE, DOUSED, BURNING, FASTMO,//FFA_DEBUFF, 
		//PUT LAST
		LENGHT
	}

	enum BUFF_STACK_TYPE {
		NONE, //Just reapply the buff
		MULTIPLE, //Adds another copy of buff
		COMBO //stacks up to certain value, ARRAY [type, combo-amount, combo-current, up-time, up-time-current]
	}


}
