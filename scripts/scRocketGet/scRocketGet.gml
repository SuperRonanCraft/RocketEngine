/// @desc Load all rockets and set the default rocket
/// @arg rocket


//temporary balance
var varspd = 2;
var varcd = .5;

var map = scRocketDefaults();
var roc = argument0;
map[? ROCKET_MAP.TYPE] = roc;

switch (roc) {
	case ROCKET.NONE:
		map[? ROCKET_MAP.DAMAGE] = 0;
		break;
		
	case ROCKET.DEFAULT:
		map[? ROCKET_MAP.NAME] = "Classic";
		map[? ROCKET_MAP.DESCRIPTION] = "Explosive device";
		map[? ROCKET_MAP.RECOIL] = 2;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.DEFAULT;
		map[? ROCKET_MAP.COOLDOWN] = 20;
		map[? ROCKET_MAP.SPEED] = 11*varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10;
		map[? ROCKET_MAP.KBAMT] = 35;
		break;
		
	case ROCKET.FAST:
		map[? ROCKET_MAP.NAME] = "Fast";
		map[? ROCKET_MAP.DESCRIPTION] = "Super sonic!";
		map[? ROCKET_MAP.RECOIL] = 3;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.FAST;
		map[? ROCKET_MAP.COOLDOWN] = 5;
		map[? ROCKET_MAP.SPEED] = 30;
		map[? ROCKET_MAP.CLIP] = 2;
		map[? ROCKET_MAP.RELOAD_TIME] = 40;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 3;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.SPRAY;
		break;
		
	case ROCKET.HOMING:
		map[? ROCKET_MAP.NAME] = "Homing";
		map[? ROCKET_MAP.DESCRIPTION] = "I will find you!";
		map[? ROCKET_MAP.RECOIL] = 5;
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.HOMING;
		map[? ROCKET_MAP.COOLDOWN] = 45;
		map[? ROCKET_MAP.SPEED] = 20;
		map[? ROCKET_MAP.TIMER] = 120;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSpecialHoming_Create;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialHoming_Step;
		map[? ROCKET_MAP.IGNORE_WALL] = false;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 7;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 15;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.HOMING;
		break;
		
	case ROCKET.REVERSE:
		map[? ROCKET_MAP.NAME] = "Reverse";
		map[? ROCKET_MAP.DESCRIPTION] = "Ima go this way";
		map[? ROCKET_MAP.RECOIL] = 5;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.REVERSE;
		map[? ROCKET_MAP.COOLDOWN] = 40;
		map[? ROCKET_MAP.SPEED] = 12*varspd;
		map[? ROCKET_MAP.OFFSET] = 10;
		map[? ROCKET_MAP.TIMER] = 180;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSpecialReverse_Create;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialReverse_Step;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketSpecialReverse_Destroy;
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 2;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 6;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.REVERSECONTROLS];
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.CLONE;
		break;
		
	case ROCKET.ICE:
		map[? ROCKET_MAP.NAME] = "Ice";
		map[? ROCKET_MAP.DESCRIPTION] = "It's cold outside";
		map[? ROCKET_MAP.RECOIL] = 5;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.ICE;
		map[? ROCKET_MAP.COOLDOWN] = 40 * varcd;
		map[? ROCKET_MAP.SPEED] = 11*varspd;
		map[? ROCKET_MAP.TIMER] = 180;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.ICE];
		map[? ROCKET_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.ICE];
		map[? ROCKET_MAP.PARTICLE_EXPLOSION] = oParticleHandler.ds_part[? PARTICLES.WINTER];
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.CHILLED];
		map[? ROCKET_MAP.EXPLOSION_SPRITE] = sexplosion_Ice;
		map[? ROCKET_MAP.EXPLOSION_ROCKET] = scRocketSpecialIce_Rocket;
		map[? ROCKET_MAP.EXPLOSION_WALL] = scRocketSpecialIce_Wall;
		map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] = scRocketSpecialIce_Shootable;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 3;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 8;
		map[? ROCKET_MAP.KBAMT] = 20;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.MIRROR;
		break;
		
	case ROCKET.FIRE:
		map[? ROCKET_MAP.NAME] = "Fire";
		map[? ROCKET_MAP.DESCRIPTION] = "Hot like lava";
		map[? ROCKET_MAP.RECOIL] = 5;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.FIRE;
		map[? ROCKET_MAP.COOLDOWN] = 50 *varcd;
		map[? ROCKET_MAP.SPEED] = 15*varspd;
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.TIMER] = 180;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.EMBER];
		map[? ROCKET_MAP.PARTICLE_EXPLOSION] = oParticleHandler.ds_part[? PARTICLES.FIRE2];
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.BURNRUSH];
		map[? ROCKET_MAP.EXPLOSION_SPRITE] = sexplosion_Fire;
		map[? ROCKET_MAP.EXPLOSION_ROCKET] = scRocketSpecialFire_Rocket;
		map[? ROCKET_MAP.EXPLOSION_WALL] = scRocketSpecialFire_Wall;
		map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] = scRocketSpecialFire_Shootable;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 4;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.LASER;
		map[? ROCKET_MAP.KBAMT] = 20;
		break;
		
	case ROCKET.SAND:
		map[? ROCKET_MAP.NAME] = "Sandy";
		map[? ROCKET_MAP.DESCRIPTION] = "In question";
		map[? ROCKET_MAP.RECOIL] = 5;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.SAND;
		map[? ROCKET_MAP.COOLDOWN] = 12;
		map[? ROCKET_MAP.SPEED] = 3 * varspd;
		map[? ROCKET_MAP.CLIP] = 5;
		map[? ROCKET_MAP.RELOAD_TIME] = 100 * varcd;
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.TIMER] = 180;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.SAND];
		map[? ROCKET_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.SAND];
		map[? ROCKET_MAP.PARTICLE_EXPLOSION] = oParticleHandler.ds_part[? PARTICLES.SAND];
		map[? ROCKET_MAP.EXPLOSION_SPRITE] = sexplosion_Sand;
		//map[? ROCKET_MAP.EXPLOSION_CREATE] = scRocketSand_ExplodeCreate;
		//map[? ROCKET_MAP.EXPLOSION_STEP] = scRocketSand_ExplodeStep;
		//map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSand_Create;
		//map[? ROCKET_MAP.ROCKET_STEP] = scRocketSand_Step;
		//map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketSand_Destroy;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 3;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 5;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.HUGEEXPLOSION;
		break;

	case ROCKET.LASER:
		map[? ROCKET_MAP.NAME] = "Laser";
		map[? ROCKET_MAP.DESCRIPTION] = "Dont stand still!";
		map[? ROCKET_MAP.RECOIL] = 5;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.LASER;
		map[? ROCKET_MAP.COOLDOWN] = 55 * varcd;
		map[? ROCKET_MAP.SPEED] = 25;
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSpecialLaser_Create;
		//map[? ROCKET_MAP.BUFF] = [BUFFTYPE.COOLDOWN];
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 2;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 12;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.BARRAGE;
		break;

	case ROCKET.SLIME:
		map[? ROCKET_MAP.NAME] = "Slime";
		map[? ROCKET_MAP.DESCRIPTION] = "A sticky situation";
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.SLIME;
		map[? ROCKET_MAP.SPEED] = 10*varspd;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.SLIME];
		map[? ROCKET_MAP.PARTICLE_EXPLOSION] = oParticleHandler.ds_part[? PARTICLES.SLIME];
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.SLIME];
		map[? ROCKET_MAP.COOLDOWN] = 28;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 3;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 5;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSpecialSlime_Create;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialSlime_Step;
		map[? ROCKET_MAP.ROCKET_DRAW] = scRocketSpecialSlime_Draw;
		map[? ROCKET_MAP.EXPLOSION_SPRITE] = sexplosion_Slime;
		map[? ROCKET_MAP.EXPLOSION_CREATE] = scRocketSpecialSlime_Exp_Create;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.SWIPE;
		//map[? ROCKET_MAP.EXPLOSION_STEP] = scRocketSpecialSlime_Exp_Step;
		//map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] = scRocketSpecialSlime_Exp_Shootable;
		//map[? ROCKET_MAP.EXPLOSION_WALL] = scRocketSpecialSlime_Exp_Wall;
		//map[? ROCKET_MAP.EXPLOSION_ROCKET] = scRocketSpecialSlime_Exp_Rocket;
		break;

	case ROCKET.RANDOM:
		map[? ROCKET_MAP.NAME] = "Random";
		map[? ROCKET_MAP.DESCRIPTION] = "RNG isn't fun";
		map[? ROCKET_MAP.DAMAGE] = 1;
		//map[? ROCKET_MAP.BUFF] = [choose(BUFFTYPE.SLIME] = BUFFTYPE.COOLDOWN] = BUFFTYPE.BURNRUSH)];
		map[? ROCKET_MAP.RECOIL] = 2;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.RANDOM;
		map[? ROCKET_MAP.COOLDOWN] = 18;
		map[? ROCKET_MAP.SPEED] = 12*varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialRandom_Step;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSpecialRandom_Create;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.SHIELD;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.ROCKETBOOTS];
		break;
		
	case ROCKET.BOUNCY:
		map[? ROCKET_MAP.NAME] = "Bouncy Castle";
		map[? ROCKET_MAP.DESCRIPTION] = "Ahhh Childhood parties";
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.RECOIL] = 2;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.BOUNCY;
		map[? ROCKET_MAP.COOLDOWN] = room_speed * 1.8;
		map[? ROCKET_MAP.SPEED] = 8 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketBouncy_Create;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketBouncy_Step;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketBouncy_Destroy;
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		map[? ROCKET_MAP.TIMER] = 4 * room_speed;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = noone;
		map[? ROCKET_MAP.ENABLED] = false;
		break;
		
	case ROCKET.SPIKED:
		map[? ROCKET_MAP.NAME] = "Spiked";
		map[? ROCKET_MAP.DESCRIPTION] = "Plushy but deadly!";
		map[? ROCKET_MAP.DAMAGE] = 0;
		map[? ROCKET_MAP.RECOIL] = 2;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.SPIKED;
		map[? ROCKET_MAP.COOLDOWN] = 25;
		map[? ROCKET_MAP.SPEED] = 16 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpiked_Step;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = noone;
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.TRAP;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.BLEEDOUT];
		break;
		
	case ROCKET.MAGNET:
		map[? ROCKET_MAP.NAME] = "Magnet";
		map[? ROCKET_MAP.DESCRIPTION] = "Positively attractive!";
		map[? ROCKET_MAP.RECOIL] = 3;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.MAGNET;
		map[? ROCKET_MAP.COOLDOWN] = 12;
		map[? ROCKET_MAP.SPEED] = 18;
		map[? ROCKET_MAP.CLIP] = 2;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSpecialHoming_Create;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketMagnet_Step;
		map[? ROCKET_MAP.RELOAD_TIME] = 60;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 2;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.MAGNET;
		map[? ROCKET_MAP.KBAMT] = 15;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.MAGNET];
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		map[? ROCKET_MAP.SCALE] = 1;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.HACKED];
		break;
		
	case ROCKET.OBSOLETE:
		map[? ROCKET_MAP.NAME] = "OBSOLETE";
		map[? ROCKET_MAP.DESCRIPTION] = "It never works ;)";
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.RECOIL] = 2;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.OBSOLETE;
		map[? ROCKET_MAP.COOLDOWN] = 40;
		map[? ROCKET_MAP.SPEED] = 12 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketObsolete_Step;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketObsolete_Create;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketObsolete_Destroy;
		map[? ROCKET_MAP.TIMER] = 4 * room_speed;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.SMOKE1];
		map[? ROCKET_MAP.ENABLED] = true;
		map[? ROCKET_MAP.ULTIMATE] = BUFFTYPE.REVERSEGRAVITY;
		break;
}

return map;