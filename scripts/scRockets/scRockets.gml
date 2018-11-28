/// @desc Load all rockets and set the default rocket
/// @arg default-rocket

//UNARMED
var roc = ROCKET.NONE;
weapons[roc] = ds_map_create();
ds_map_add(weapons[roc], ROCKET_MAP.TYPE, roc);
ds_map_add(weapons[roc], ROCKET_MAP.DAMAGE, 0);

//DEFAULT
roc = ROCKET.DEFAULT;
weapons[roc] = ds_map_create();
ds_map_add(weapons[roc], ROCKET_MAP.TYPE, roc);
ds_map_add(weapons[roc], ROCKET_MAP.NAME, "Default");
ds_map_add(weapons[roc], ROCKET_MAP.DESCRIPTION, "Explosive  device");
ds_map_add(weapons[roc], ROCKET_MAP.RECOIL, 2);
ds_map_add(weapons[roc], ROCKET_MAP.PROJECTILE, ROCKET_SPRITE.DEFAULT);
ds_map_add(weapons[roc], ROCKET_MAP.COOLDOWN, 20);
ds_map_add(weapons[roc], ROCKET_MAP.SPEED, 10);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_MAGNITUDE, 1);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_FRAMES, 10);

//FAST
roc = ROCKET.FAST;
weapons[roc] = ds_map_create();
ds_map_add(weapons[roc], ROCKET_MAP.TYPE, roc);
ds_map_add(weapons[roc], ROCKET_MAP.NAME, "Fast");
ds_map_add(weapons[roc], ROCKET_MAP.DESCRIPTION, "Super  sonic!");
ds_map_add(weapons[roc], ROCKET_MAP.RECOIL, 3);
ds_map_add(weapons[roc], ROCKET_MAP.PROJECTILE, ROCKET_SPRITE.FAST);
ds_map_add(weapons[roc], ROCKET_MAP.COOLDOWN, 5);
ds_map_add(weapons[roc], ROCKET_MAP.SPEED, 22);
ds_map_add(weapons[roc], ROCKET_MAP.CLIP, 2);
ds_map_add(weapons[roc], ROCKET_MAP.RELOAD_TIME, 60);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_MAGNITUDE, 1);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_FRAMES, 3);

//HOMING
roc = ROCKET.HOMING;
weapons[roc] = ds_map_create();
ds_map_add(weapons[roc], ROCKET_MAP.TYPE, roc);
ds_map_add(weapons[roc], ROCKET_MAP.NAME, "Homing");
ds_map_add(weapons[roc], ROCKET_MAP.DESCRIPTION, "I  will  find  you!");
ds_map_add(weapons[roc], ROCKET_MAP.RECOIL, 5);
ds_map_add(weapons[roc], ROCKET_MAP.DAMAGE, 1);
ds_map_add(weapons[roc], ROCKET_MAP.PROJECTILE, ROCKET_SPRITE.HOMING);
ds_map_add(weapons[roc], ROCKET_MAP.COOLDOWN, 60);
ds_map_add(weapons[roc], ROCKET_MAP.SPEED, 15);
ds_map_add(weapons[roc], ROCKET_MAP.TIMER, 120);
ds_map_add(weapons[roc], ROCKET_MAP.ROCKET_CREATE, scRocketSpecialHoming_Create);
ds_map_add(weapons[roc], ROCKET_MAP.ROCKET_STEP, scRocketSpecialHoming_Step);
ds_map_add(weapons[roc], ROCKET_MAP.IGNORE_WALL, true);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_MAGNITUDE, 7);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_FRAMES, 15);

//REVERSE
roc = ROCKET.REVERSE;
weapons[roc] = ds_map_create();
ds_map_add(weapons[roc], ROCKET_MAP.TYPE, roc);
ds_map_add(weapons[roc], ROCKET_MAP.NAME, "Reverse");
ds_map_add(weapons[roc], ROCKET_MAP.DESCRIPTION, "Ima  go  this  way");
ds_map_add(weapons[roc], ROCKET_MAP.RECOIL, 5);
ds_map_add(weapons[roc], ROCKET_MAP.PROJECTILE, ROCKET_SPRITE.REVERSE);
ds_map_add(weapons[roc], ROCKET_MAP.COOLDOWN, 40);
ds_map_add(weapons[roc], ROCKET_MAP.SPEED, 5);
ds_map_add(weapons[roc], ROCKET_MAP.OFFSET, 10);
ds_map_add(weapons[roc], ROCKET_MAP.TIMER, 180);
ds_map_add(weapons[roc], ROCKET_MAP.ROCKET_CREATE, scRocketSpecialReverse_Create);
ds_map_add(weapons[roc], ROCKET_MAP.ROCKET_STEP, scRocketSpecialReverse_Step);
ds_map_add(weapons[roc], ROCKET_MAP.IGNORE_WALL, true);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_MAGNITUDE, 2);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_FRAMES, 6);

//ICE
roc = ROCKET.ICE;
weapons[roc] = ds_map_create();
ds_map_add(weapons[roc], ROCKET_MAP.TYPE, roc);
ds_map_add(weapons[roc], ROCKET_MAP.NAME, "Ice");
ds_map_add(weapons[roc], ROCKET_MAP.DESCRIPTION, "It's  cold  outside");
ds_map_add(weapons[roc], ROCKET_MAP.RECOIL, 5);
ds_map_add(weapons[roc], ROCKET_MAP.PROJECTILE, ROCKET_SPRITE.ICE);
ds_map_add(weapons[roc], ROCKET_MAP.COOLDOWN, 40);
ds_map_add(weapons[roc], ROCKET_MAP.SPEED, 10);
ds_map_add(weapons[roc], ROCKET_MAP.TIMER, 180);
ds_map_add(weapons[roc], ROCKET_MAP.PARTICLE_TRAIL, oParticleHandler.ds_part[? PARTICLES.ICE]);
ds_map_add(weapons[roc], ROCKET_MAP.PARTICLE_EXPLOSION, oParticleHandler.ds_part[? PARTICLES.WINTER]);
ds_map_add(weapons[roc], ROCKET_MAP.BUFF, [BUFFTYPE.CHILLED]);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_SPRITE, sexplosion_Ice);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_ROCKET, scRocketSpecialIce_Rocket);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_WALL, scRocketSpecialIce_Wall);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_SHOOTABLE, scRocketSpecialIce_Shootable);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_MAGNITUDE, 3);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_FRAMES, 8);

//FIRE
roc = ROCKET.FIRE;
weapons[roc] = ds_map_create();
ds_map_add(weapons[roc], ROCKET_MAP.TYPE, roc);
ds_map_add(weapons[roc], ROCKET_MAP.NAME, "Fire");
ds_map_add(weapons[roc], ROCKET_MAP.DESCRIPTION, "Run  like... faster");
ds_map_add(weapons[roc], ROCKET_MAP.RECOIL, 5);
ds_map_add(weapons[roc], ROCKET_MAP.PROJECTILE, ROCKET_SPRITE.FIRE);
ds_map_add(weapons[roc], ROCKET_MAP.COOLDOWN, 50);
ds_map_add(weapons[roc], ROCKET_MAP.SPEED, 13);
ds_map_add(weapons[roc], ROCKET_MAP.DAMAGE, 1);
ds_map_add(weapons[roc], ROCKET_MAP.TIMER, 180);
ds_map_add(weapons[roc], ROCKET_MAP.PARTICLE_TRAIL, oParticleHandler.ds_part[? PARTICLES.EMBER]);
ds_map_add(weapons[roc], ROCKET_MAP.PARTICLE_EXPLOSION, oParticleHandler.ds_part[? PARTICLES.FIRE2]);
ds_map_add(weapons[roc], ROCKET_MAP.BUFF, [BUFFTYPE.BURNRUSH]);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_SPRITE, sexplosion_Fire);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_ROCKET, scRocketSpecialFire_Rocket);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_WALL, scRocketSpecialFire_Wall);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_SHOOTABLE, scRocketSpecialFire_Shootable);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_MAGNITUDE, 4);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_FRAMES, 10);

//SAND
roc = ROCKET.SAND;
weapons[roc] = ds_map_create();
ds_map_add(weapons[roc], ROCKET_MAP.TYPE, roc);
ds_map_add(weapons[roc], ROCKET_MAP.NAME, "Sandy");
ds_map_add(weapons[roc], ROCKET_MAP.DESCRIPTION, "Dusty  but  laggy");
ds_map_add(weapons[roc], ROCKET_MAP.RECOIL, 5);
ds_map_add(weapons[roc], ROCKET_MAP.PROJECTILE, ROCKET_SPRITE.SAND);
ds_map_add(weapons[roc], ROCKET_MAP.COOLDOWN, 100);
ds_map_add(weapons[roc], ROCKET_MAP.SPEED, 5);
ds_map_add(weapons[roc], ROCKET_MAP.DAMAGE, 1);
ds_map_add(weapons[roc], ROCKET_MAP.DAMAGE_ROCKET, 2);
ds_map_add(weapons[roc], ROCKET_MAP.TIMER, 180);
ds_map_add(weapons[roc], ROCKET_MAP.PARTICLE_TRAIL, oParticleHandler.ds_part[? PARTICLES.SAND]);
ds_map_add(weapons[roc], ROCKET_MAP.PARTICLE_EXPLOSION, oParticleHandler.ds_part[? PARTICLES.SAND]);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_SPRITE, sexplosion_Sand);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_CREATE, scRocketSpecialSand_ExplodeCreate);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_STEP, scRocketSpecialSand_ExplodeStep);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_MAGNITUDE, 3);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_FRAMES, 5);

//LASER
roc = ROCKET.LASER;
weapons[roc] = ds_map_create();
ds_map_add(weapons[roc], ROCKET_MAP.TYPE, roc);
ds_map_add(weapons[roc], ROCKET_MAP.NAME, "Laser");
ds_map_add(weapons[roc], ROCKET_MAP.DESCRIPTION, "Just  don't  afk");
ds_map_add(weapons[roc], ROCKET_MAP.RECOIL, 5);
ds_map_add(weapons[roc], ROCKET_MAP.PROJECTILE, ROCKET_SPRITE.LASER);
ds_map_add(weapons[roc], ROCKET_MAP.COOLDOWN, 50);
ds_map_add(weapons[roc], ROCKET_MAP.SPEED, 5);
ds_map_add(weapons[roc], ROCKET_MAP.DAMAGE, 2);
ds_map_add(weapons[roc], ROCKET_MAP.IGNORE_WALL, true);
ds_map_add(weapons[roc], ROCKET_MAP.ROCKET_CREATE, scRocketSpecialLaser_Create);
ds_map_add(weapons[roc], ROCKET_MAP.BUFF, [BUFFTYPE.COOLDOWN]);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_MAGNITUDE, 2);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_FRAMES, 12);

//SLIME
roc = ROCKET.SLIME;
weapons[roc] = ds_map_create();
ds_map_add(weapons[roc], ROCKET_MAP.TYPE, roc);
ds_map_add(weapons[roc], ROCKET_MAP.NAME, "Slime");
ds_map_add(weapons[roc], ROCKET_MAP.DESCRIPTION, "A  slimy  mess");
ds_map_add(weapons[roc], ROCKET_MAP.PROJECTILE, ROCKET_SPRITE.SLIME);
ds_map_add(weapons[roc], ROCKET_MAP.SPEED, 10);
ds_map_add(weapons[roc], ROCKET_MAP.PARTICLE_TRAIL, oParticleHandler.ds_part[? PARTICLES.SLIME]);
ds_map_add(weapons[roc], ROCKET_MAP.PARTICLE_EXPLOSION, oParticleHandler.ds_part[? PARTICLES.SLIME]);
ds_map_add(weapons[roc], ROCKET_MAP.DAMAGE, 1);
ds_map_add(weapons[roc], ROCKET_MAP.BUFF, [BUFFTYPE.SLIME]);
ds_map_add(weapons[roc], ROCKET_MAP.COOLDOWN, 30);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_MAGNITUDE, 3);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_FRAMES, 5);
ds_map_add(weapons[roc], ROCKET_MAP.ROCKET_CREATE, scRocketSpecialSlime_Create);
ds_map_add(weapons[roc], ROCKET_MAP.ROCKET_STEP, scRocketSpecialSlime_Step);
ds_map_add(weapons[roc], ROCKET_MAP.ROCKET_DRAW, scRocketSpecialSlime_Draw);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_SPRITE, sexplosion_Slime);
ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_CREATE, scRocketSpecialSlime_Exp_Create);
//ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_STEP, scRocketSpecialSlime_Exp_Step);
//ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_SHOOTABLE, scRocketSpecialSlime_Exp_Shootable);
//ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_WALL, scRocketSpecialSlime_Exp_Wall);
//ds_map_add(weapons[roc], ROCKET_MAP.EXPLOSION_ROCKET, scRocketSpecialSlime_Exp_Rocket);

//TESTING
roc = ROCKET.OP;
weapons[roc] = ds_map_create();
ds_map_add(weapons[roc], ROCKET_MAP.TYPE, roc);
ds_map_add(weapons[roc], ROCKET_MAP.NAME, "Overpowered");
ds_map_add(weapons[roc], ROCKET_MAP.DESCRIPTION, "You  wont  live...");
ds_map_add(weapons[roc], ROCKET_MAP.BUFF, [BUFFTYPE.SLIME, BUFFTYPE.COOLDOWN, BUFFTYPE.BURNRUSH]);
ds_map_add(weapons[roc], ROCKET_MAP.RECOIL, 2);
ds_map_add(weapons[roc], ROCKET_MAP.PROJECTILE, ROCKET_SPRITE.OP);
ds_map_add(weapons[roc], ROCKET_MAP.COOLDOWN, 20);
ds_map_add(weapons[roc], ROCKET_MAP.SPEED, 10);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_MAGNITUDE, 1);
ds_map_add(weapons[roc], ROCKET_MAP.SHAKE_FRAMES, 10);

enum ROCKET {
	NONE,
	DEFAULT, 
	FAST,
	HOMING, 
	REVERSE, 
	ICE,
	FIRE,
	SAND,
	LASER,
	SLIME,
	OP,
	
	//KEEP LAST
	LENGHT
}

enum ROCKET_SPRITE {
	//Mostly used to save memory on oRocketPickup, or to insta grab a rocket sprite
	NONE = noone, DEFAULT = sRocket_Default, FAST = sRocket_Fast, HOMING = sRocket_Homing, REVERSE = sRocket_Reverse, 
	ICE = sRocket_Ice, FIRE = sRocket_Fire, SAND = sRocket_Sand, LASER = sRocket_Laser, SLIME = sRocket_Slime, OP = sRocket_Default
}

enum ROCKET_MAP {
	//BASIC VARIABLES
	RECOIL, PROJECTILE, PROJECTILE_SOUND, COOLDOWN, SPEED, OFFSET, STARTUP, CLIP,
	RELOAD_TIME, TIMER, IGNORE_WALL, NAME, DESCRIPTION, BUFF, TYPE, 
	//DAMAGE TYPES
	DAMAGE, DAMAGE_ROCKET, DAMAGE_EXPLOSION,
	//ROCKET EVENTS
	ROCKET_CREATE, ROCKET_STEP, ROCKET_DRAW,
	//PARTICLES
	PARTICLE_TRAIL, PARTICLE_EXPLOSION,
	//CAMERA SHAKE
	SHAKE_MAGNITUDE, SHAKE_FRAMES,
	//EXPLOSION SCRIPTS
	EXPLOSION_SPRITE, EXPLOSION_ROCKET, EXPLOSION_WALL, EXPLOSION_SHOOTABLE, EXPLOSION_STEP, EXPLOSION_CREATE
}

//Rocket progress
current_cd = 0;
current_delay = -1;
current_recoil = 0;
current_reload = 0;
rockets = 0;
rocket_map = 0;

//Setup the default rocket type
scChangeRocket(argument0);