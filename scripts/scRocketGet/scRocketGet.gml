/// @desc Load all rockets and set the default rocket
/// @arg rocket

var varspd = 0.5;
var varcd = TIME_SPEED;
var vartime = TIME_SPEED;
var varkb = TIME_SPEED;
var varrc = 1;

var map = scRocketDefaults();
var roc = argument0;
map[? ROCKET_MAP.TYPE] = roc;

switch (roc) {
	case ROCKET.NONE:
		map[? ROCKET_MAP.DAMAGE] = 0;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.NONE;
		break;
		
	case ROCKET.DEFAULT:
		map[? ROCKET_MAP.NAME] = "Classic";
		map[? ROCKET_MAP.DESCRIPTION] = "Explosive device";
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.DEFAULT;
		map[? ROCKET_MAP.COOLDOWN] = 20 * varcd;
		map[? ROCKET_MAP.SPEED] = 20 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10 * vartime;
		break;
		
	case ROCKET.FAST:
		map[? ROCKET_MAP.NAME] = "Fast";
		map[? ROCKET_MAP.DESCRIPTION] = "Super sonic!";
		map[? ROCKET_MAP.RECOIL] = 1 * varrc;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.FAST;
		map[? ROCKET_MAP.COOLDOWN] = 5 * varcd;
		map[? ROCKET_MAP.SPEED] = 30 * varspd;
		map[? ROCKET_MAP.CLIP] = 2;
		map[? ROCKET_MAP.RELOAD_TIME] = 80;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 3 * vartime;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.SLOWMO;
		map[? ROCKET_MAP.KBAMT] = 24 / varkb;
		break;
		
	case ROCKET.HOMING:
		map[? ROCKET_MAP.NAME] = "Homing";
		map[? ROCKET_MAP.DESCRIPTION] = "I will find you!";
		map[? ROCKET_MAP.RECOIL] = 5 * varrc;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.HOMING;
		map[? ROCKET_MAP.COOLDOWN] = 45 * varcd;
		map[? ROCKET_MAP.SPEED] = 20 * varspd;
		map[? ROCKET_MAP.TIMER] = 120 * vartime;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSpecialHoming_Create;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialHoming_Step;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketSpecialHoming_Destroy;
		map[? ROCKET_MAP.ROCKET_DRAW_UNDER] = scRocketSpecialHoming_Draw;
		map[? ROCKET_MAP.IGNORE_WALL] = false;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 7;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 15 * vartime;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.HOMING;
		break;
		
	case ROCKET.REVERSE:
		map[? ROCKET_MAP.NAME] = "Reverse";
		map[? ROCKET_MAP.DESCRIPTION] = "Ima go this way";
		map[? ROCKET_MAP.RECOIL] = -5 * varrc;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.REVERSE;
		map[? ROCKET_MAP.COOLDOWN] = 40 * varcd;
		map[? ROCKET_MAP.SPEED] = 18 * varspd;
		map[? ROCKET_MAP.OFFSET] = 10;
		map[? ROCKET_MAP.TIMER] = 180 * vartime;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSpecialReverse_Create;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialReverse_Step;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketSpecialReverse_Destroy;
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 2;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 6 * vartime;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.REVERSECONTROLS];
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.CLONE;
		map[? ROCKET_MAP.KBAMT] = 20 / varkb;
		break;
		
	case ROCKET.ICE:
		map[? ROCKET_MAP.NAME] = "Ice";
		map[? ROCKET_MAP.DESCRIPTION] = "It's cold outside";
		map[? ROCKET_MAP.RECOIL] = 5 * varrc;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.ICE;
		map[? ROCKET_MAP.COOLDOWN] = 25 * varcd;
		map[? ROCKET_MAP.SPEED] = 19 * varspd;
		map[? ROCKET_MAP.TIMER] = 180 * vartime;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.ICE];
		map[? ROCKET_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.ICE];
		map[? ROCKET_MAP.PARTICLE_EXPLOSION] = oParticleHandler.ds_part[? PARTICLES.WINTER];
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.CHILLED];
		map[? ROCKET_MAP.EXPLOSION_SPRITE] = sexplosion_Ice;
		map[? ROCKET_MAP.EXPLOSION_ROCKET] = scRocketSpecialIce_Rocket;
		map[? ROCKET_MAP.EXPLOSION_WALL] = scRocketSpecialIce_Wall;
		map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] = scRocketSpecialIce_Shootable;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 3;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 8 * vartime;
		map[? ROCKET_MAP.KBAMT] = 20;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.MIRROR;
		break;
		
	case ROCKET.FIRE:
		map[? ROCKET_MAP.NAME] = "Fire";
		map[? ROCKET_MAP.DESCRIPTION] = "Hot like lava";
		map[? ROCKET_MAP.RECOIL] = 5 * varrc;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.FIRE;
		map[? ROCKET_MAP.COOLDOWN] = 25 * varcd;
		map[? ROCKET_MAP.SPEED] = 22 * varspd;
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.TIMER] = 180 * vartime;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.EMBER];
		map[? ROCKET_MAP.PARTICLE_EXPLOSION] = oParticleHandler.ds_part[? PARTICLES.FIRE2];
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.BURNRUSH];
		map[? ROCKET_MAP.EXPLOSION_SPRITE] = sexplosion_Fire;
		map[? ROCKET_MAP.EXPLOSION_ROCKET] = scRocketSpecialFire_Rocket;
		map[? ROCKET_MAP.EXPLOSION_WALL] = scRocketSpecialFire_Wall;
		map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] = scRocketSpecialFire_Shootable;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 4;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10 * vartime;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.LASER;
		map[? ROCKET_MAP.KBAMT] = 40 / varkb;
		break;
		
	case ROCKET.SAND:
		map[? ROCKET_MAP.NAME] = "Sandy";
		map[? ROCKET_MAP.DESCRIPTION] = "In question";
		map[? ROCKET_MAP.DAMAGE] = 2;
		map[? ROCKET_MAP.RECOIL] = 2 * varrc;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.SAND;
		map[? ROCKET_MAP.COOLDOWN] = 12 * varcd;
		map[? ROCKET_MAP.SPEED] = 6 * varspd;
		map[? ROCKET_MAP.CLIP] = 5;
		map[? ROCKET_MAP.RELOAD_TIME] = 60 * varcd;
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.TIMER] = 180 * vartime;
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
		map[? ROCKET_MAP.SHAKE_FRAMES] = 5 * vartime;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.HUGEEXPLOSION;
		break;

	case ROCKET.LASER:
		map[? ROCKET_MAP.NAME] = "Laser";
		map[? ROCKET_MAP.DESCRIPTION] = "Dont stand still!";
		map[? ROCKET_MAP.RECOIL] = 5 * varrc;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.LASER;
		map[? ROCKET_MAP.COOLDOWN] = 30 * varcd;
		map[? ROCKET_MAP.SPEED] = 22 * varspd;
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSpecialLaser_Create;
		//map[? ROCKET_MAP.BUFF] = [BUFFTYPE.COOLDOWN];
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 2;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 12 * vartime;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.BARRAGE;
		break;

	case ROCKET.SLIME:
		map[? ROCKET_MAP.NAME] = "Slime";
		map[? ROCKET_MAP.DESCRIPTION] = "A sticky situation";
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.SLIME;
		map[? ROCKET_MAP.SPEED] = 18 * varspd;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.SLIME];
		map[? ROCKET_MAP.PARTICLE_EXPLOSION] = oParticleHandler.ds_part[? PARTICLES.SLIME];
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.SLIME];
		map[? ROCKET_MAP.COOLDOWN] = 27 * varcd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 3;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 5 * vartime;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSlime_Create;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketSlime_Step;
		map[? ROCKET_MAP.EXPLOSION_SPRITE] = sexplosion_Slime;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.SLUDGE;
		break;

	case ROCKET.RANDOM:
		map[? ROCKET_MAP.NAME] = "Random";
		map[? ROCKET_MAP.DESCRIPTION] = "RNG isn't fun";
		map[? ROCKET_MAP.DAMAGE] = 1;
		//map[? ROCKET_MAP.BUFF] = [choose(BUFFTYPE.SLIME] = BUFFTYPE.COOLDOWN] = BUFFTYPE.BURNRUSH)];
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.RANDOM;
		map[? ROCKET_MAP.COOLDOWN] = 18 * varcd;
		map[? ROCKET_MAP.SPEED] = 24 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10 * vartime;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialRandom_Step;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketSpecialRandom_Create;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.AMPWALL;
		//map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.SHIELD;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.ROCKETBOOTS];
		break;
		
	case ROCKET.BOUNCY:
		map[? ROCKET_MAP.NAME] = "Bouncy Castle";
		map[? ROCKET_MAP.DESCRIPTION] = "Ahhh Childhood parties";
		map[? ROCKET_MAP.DAMAGE] = 2;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.BOUNCY;
		map[? ROCKET_MAP.COOLDOWN] = room_speed * 1.8;
		map[? ROCKET_MAP.SPEED] = 16 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10 * vartime;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketBouncy_Create;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketBouncy_Step;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketBouncy_Destroy;
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		map[? ROCKET_MAP.TIMER] = 120 * vartime;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = noone;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.ANTIHEAL];
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.JUMPPAD;
		break;
		
	case ROCKET.SPIKED:
		map[? ROCKET_MAP.NAME] = "Spiked";
		map[? ROCKET_MAP.DESCRIPTION] = "Plushy but deadly!";
		map[? ROCKET_MAP.DAMAGE] = 0;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.SPIKED;
		map[? ROCKET_MAP.COOLDOWN] = 25 * varcd;
		map[? ROCKET_MAP.SPEED] = 32 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10 * vartime;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpiked_Step;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = noone;
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.TRAP;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.BLEEDOUT];
		break;
		
	case ROCKET.MAGNET:
		map[? ROCKET_MAP.NAME] = "Magnet";
		map[? ROCKET_MAP.DESCRIPTION] = "Positively attractive!";
		map[? ROCKET_MAP.RECOIL] = 3 * varrc;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.MAGNET;
		map[? ROCKET_MAP.COOLDOWN] = 18 * varcd;
		map[? ROCKET_MAP.SPEED] = 15 * varspd;
		map[? ROCKET_MAP.CLIP] = 2;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketMagnet_Create;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketMagnet_Step;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketMagnet_Destroy;
		map[? ROCKET_MAP.RELOAD_TIME] = 60 * vartime;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 2 * vartime;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.MAGNET;
		map[? ROCKET_MAP.KBAMT] = 15 * varkb;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.MAGNET];
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		map[? ROCKET_MAP.SCALE] = 1;
		break;
		
	case ROCKET.OBSOLETE:
		map[? ROCKET_MAP.NAME] = "OBSOLETE";
		map[? ROCKET_MAP.DESCRIPTION] = "It never works ;)";
		map[? ROCKET_MAP.DAMAGE] = 2;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.OBSOLETE;
		map[? ROCKET_MAP.COOLDOWN] = 40 * varcd;
		map[? ROCKET_MAP.SPEED] = 24 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 1;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10 * vartime;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketObsolete_Step;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketObsolete_Create;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketObsolete_Destroy;
		map[? ROCKET_MAP.ROCKET_DRAW_UNDER] = scRocketObsolete_Draw;
		map[? ROCKET_MAP.TIMER] = 120 * vartime;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = noone;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.NAPALM;
		break;
	
	case ROCKET.LIGHTNING:
		map[? ROCKET_MAP.NAME] = "LIGHTNING";
		map[? ROCKET_MAP.DESCRIPTION] = "The power of clouds!";
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.DAMAGE_EXPLOSION] = 1;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.LIGHTNING;
		map[? ROCKET_MAP.COOLDOWN] = 35 * varcd;
		map[? ROCKET_MAP.SPEED] = 15 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 3;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 10 * vartime;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketLightning_Step;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketLightning_Create;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketLightning_Destroy;
		map[? ROCKET_MAP.ROCKET_DRAW_UNDER] = scRocketLightning_Draw;
		map[? ROCKET_MAP.EXPLOSION_CREATE_DRAW] = scRocketLightning_DrawExplode;
		map[? ROCKET_MAP.EXPLOSION_CREATE] = scRocketLightning_CreateExplode;
		map[? ROCKET_MAP.TIMER] = 120 * vartime;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = noone;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.REVERSEGRAVITY];
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.LIGHTNING_ORB;
		break;
	
	case ROCKET.SHOTGUN:
		map[? ROCKET_MAP.NAME] = "SHOTGUN";
		map[? ROCKET_MAP.DESCRIPTION] = "Tired of missing?";
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.SHOTGUN;
		map[? ROCKET_MAP.COOLDOWN] = 55 * varcd;
		map[? ROCKET_MAP.SPEED] = 13 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 2;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 5 * vartime;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketShotgun_Create;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketShotgun_Step;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketShotgun_Destroy;
		map[? ROCKET_MAP.PARTICLE_EXPLOSION] = oParticleHandler.ds_part[? PARTICLES.SMOKE3];
		map[? ROCKET_MAP.PARTICLE_AMT] = 100;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.SPRAY;
		break;
	
	case ROCKET.PEACE:
		map[? ROCKET_MAP.NAME] = "Peace";
		map[? ROCKET_MAP.DESCRIPTION] = "Good vibes brooo";
		map[? ROCKET_MAP.DAMAGE] = 0;
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.PEACE;
		map[? ROCKET_MAP.COOLDOWN] = 10 * varcd;
		map[? ROCKET_MAP.CLIP] = 3;
		map[? ROCKET_MAP.RELOAD_TIME] = 30 * varcd;
		map[? ROCKET_MAP.SPEED] = 16 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 2;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 5 * vartime;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.PEACE];
		map[? ROCKET_MAP.PARTICLE_AMT] = oParticleHandler.ds_part_amt[? PARTICLES.PEACE];
		//map[? ROCKET_MAP.PARTICLE_EXPLOSION] = oParticleHandler.ds_part[? PARTICLES.PEACE];
		map[? ROCKET_MAP.EXPLOSION_SPRITE] = sexplosion_Peace;
		map[? ROCKET_MAP.BUFF] = [BUFFTYPE.HACKED];
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.SLEEPDART;
		map[? ROCKET_MAP.PARTICLE_CHANGE_ORIENTATION] = false;
		break;
	
	case ROCKET.TELEPORT:
		map[? ROCKET_MAP.NAME] = "Portal";
		map[? ROCKET_MAP.DESCRIPTION] = "Back to the Future!";
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.TELEPORT;
		map[? ROCKET_MAP.COOLDOWN] = 60 * varcd;
		map[? ROCKET_MAP.SPEED] = 13 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 2;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 5 * vartime;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketTeleport_Step;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketTeleport_Create;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketTeleport_Destroy;
		map[? ROCKET_MAP.ROCKET_DRAW_OVER] = scRocketTeleport_Draw;
		map[? ROCKET_MAP.ROCKET_AUTO_DESTROY] = false;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.PORTAL;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.PORTAL];
		map[? ROCKET_MAP.PARTICLE_AMT] = 1;
		map[? ROCKET_MAP.PARTICLE_EXPLOSION] = oParticleHandler.ds_part[? PARTICLES.PORTAL];
		break;
	
	case ROCKET.ARCHING:
		map[? ROCKET_MAP.NAME] = "Bowing";
		map[? ROCKET_MAP.DESCRIPTION] = "The ark!";
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.ARCHING;
		map[? ROCKET_MAP.COOLDOWN] = 8 * varcd;
		map[? ROCKET_MAP.SPEED] = 11 * varspd;
		map[? ROCKET_MAP.RELOAD_TIME] = 50 * varcd;
		map[? ROCKET_MAP.CLIP] = 3;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 2;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 5 * vartime;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketArching_Step;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketArching_Create;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketArching_Destroy;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.HACKLOOT;
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		break;
		
	case ROCKET.BOOMERANG:
		map[? ROCKET_MAP.NAME] = "Boomerang";
		map[? ROCKET_MAP.DESCRIPTION] = "The skill!";
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.BOOMERANG;
		map[? ROCKET_MAP.RECOIL] = 1 * varkb;
		map[? ROCKET_MAP.COOLDOWN] = 46 * varcd;
		map[? ROCKET_MAP.SPEED] = 5 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 2;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 2 * vartime;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketBoomerang_Step;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketBoomerang_Create;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketBoomerang_Destroy;
		map[? ROCKET_MAP.IGNORE_WALL] = true;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = noone;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.ORBIT;
		break;
		
	case ROCKET.BRICK:
		map[? ROCKET_MAP.NAME] = "Brick";
		map[? ROCKET_MAP.DESCRIPTION] = "Drops like a Stone!";
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.BRICK;
		map[? ROCKET_MAP.DAMAGE] = 3;
		map[? ROCKET_MAP.RECOIL] = 3 * varkb;
		map[? ROCKET_MAP.COOLDOWN] = 48 * varcd;
		map[? ROCKET_MAP.SPEED] = 8 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 3;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 4 * vartime;
		map[? ROCKET_MAP.ROCKET_STEP] = scRocketBrick_Step;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketBrick_Create;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketBrick_Destroy;
		map[? ROCKET_MAP.ROCKET_DRAW_UNDER] = scRocketBrick_Draw;
		map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.SMOKE1];
		map[? ROCKET_MAP.EXPLOSION_SPRITE] = sexplosion_Brick;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.BRICKWALL;
		map[? "scrape_part"] = PARTICLES.SCRAPE;
		break;
		
	case ROCKET.PIERCING:
		map[? ROCKET_MAP.NAME] = "Piercing";
		map[? ROCKET_MAP.DESCRIPTION] = "Can't touch this.";
		map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.PIERCING;
		map[? ROCKET_MAP.DAMAGE] = 1;
		map[? ROCKET_MAP.RECOIL] = 3 * varkb;
		map[? ROCKET_MAP.COOLDOWN] = 48 * varcd;
		map[? ROCKET_MAP.SPEED] = 8 * varspd;
		map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 3;
		map[? ROCKET_MAP.SHAKE_FRAMES] = 6 * vartime;
		map[? ROCKET_MAP.ROCKET_CREATE] = scRocketPiercing_Create;
		map[? ROCKET_MAP.ROCKET_DESTROY] = scRocketPiercing_Destroy;
		map[? ROCKET_MAP.ROCKET_DRAW_OVER] = scRocketPiercing_Draw;
		map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.TURRET;
		map[? ROCKET_MAP.ROCKET_AUTO_DESTROY] = false;
		break;
}

return map;