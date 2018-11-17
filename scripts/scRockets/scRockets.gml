/// @desc Load all rockets and set the default rocket
/// @arg default-rocket

//UNARMED
weapons[0] = ds_map_create();
ds_map_add(weapons[0], ROCKET_MAP.DAMAGE, 0);

//DEFAULT
weapons[1] = ds_map_create();
ds_map_add(weapons[1], ROCKET_MAP.RECOIL, 2);
ds_map_add(weapons[1], ROCKET_MAP.PROJECTILE, sRocket_Default);
ds_map_add(weapons[1], ROCKET_MAP.COOLDOWN, 20);
ds_map_add(weapons[1], ROCKET_MAP.SPEED, 10);

//FAST
weapons[2] = ds_map_create();
ds_map_add(weapons[2], ROCKET_MAP.RECOIL, 3);
ds_map_add(weapons[2], ROCKET_MAP.PROJECTILE, sRocket_Fast);
ds_map_add(weapons[2], ROCKET_MAP.COOLDOWN, 5);
ds_map_add(weapons[2], ROCKET_MAP.SPEED, 22);
ds_map_add(weapons[2], ROCKET_MAP.CLIP, 5);
ds_map_add(weapons[2], ROCKET_MAP.RELOAD_TIME, 60);

//HOMING
weapons[3] = ds_map_create();
ds_map_add(weapons[3], ROCKET_MAP.RECOIL, 5);
ds_map_add(weapons[3], ROCKET_MAP.DAMAGE, 2);
ds_map_add(weapons[3], ROCKET_MAP.PROJECTILE, sRocket_Homing);
ds_map_add(weapons[3], ROCKET_MAP.COOLDOWN, 60);
ds_map_add(weapons[3], ROCKET_MAP.SPEED, 5);
ds_map_add(weapons[3], ROCKET_MAP.TIMER, 120);
ds_map_add(weapons[3], ROCKET_MAP.SPECIALS, scRocketSpecialHoming);
ds_map_add(weapons[3], ROCKET_MAP.IGNORE_WALL, true);

//REVERSE
weapons[4] = ds_map_create();
ds_map_add(weapons[4], ROCKET_MAP.RECOIL, 5);
ds_map_add(weapons[4], ROCKET_MAP.PROJECTILE, sRocket_Reverse);
ds_map_add(weapons[4], ROCKET_MAP.COOLDOWN, 40);
ds_map_add(weapons[4], ROCKET_MAP.SPEED, 5);
ds_map_add(weapons[4], ROCKET_MAP.OFFSET, 10);
ds_map_add(weapons[4], ROCKET_MAP.TIMER, 180);
ds_map_add(weapons[4], ROCKET_MAP.SPECIALS, scRocketSpecialReverse);
ds_map_add(weapons[4], ROCKET_MAP.IGNORE_WALL, true);

//ICE
weapons[5] = ds_map_create();
ds_map_add(weapons[5], ROCKET_MAP.NAME, "Ice Rocket");
ds_map_add(weapons[5], ROCKET_MAP.RECOIL, 5);
ds_map_add(weapons[5], ROCKET_MAP.PROJECTILE, sRocket_Ice);
ds_map_add(weapons[5], ROCKET_MAP.COOLDOWN, 40);
ds_map_add(weapons[5], ROCKET_MAP.SPEED, 10);
ds_map_add(weapons[5], ROCKET_MAP.TIMER, 180);
ds_map_add(weapons[5], ROCKET_MAP.SPECIALS, scRocketSpecialChilled);
ds_map_add(weapons[5], ROCKET_MAP.PARTICLE_TRAIL, oParticleHandler.ds_part[? PARTICLES.ICE]);
ds_map_add(weapons[5], ROCKET_MAP.PARTICLE_EXPLOSION, oParticleHandler.ds_part[? PARTICLES.WINTER]);
ds_map_add(weapons[5], ROCKET_MAP.BUFF, BUFFTYPE.CHILLED);
ds_map_add(weapons[5], ROCKET_MAP.EXPLOSION, sexplosion_Ice);
/*ds_map_add(weapons[5], "specialCollideRocket", scRocketSpecialIce_Rocket);
ds_map_add(weapons[5], "specialCollideWall",scRocketSpecialIce_Wall);
ds_map_add(weapons[5], "specialCollideShootable", scRocketSpecialIce_Shootable);*/

//FIRE
weapons[6] = ds_map_create();

ds_map_add(weapons[6], ROCKET_MAP.NAME, "Fire Rocket");
ds_map_add(weapons[6], ROCKET_MAP.RECOIL, 5);
ds_map_add(weapons[6], ROCKET_MAP.PROJECTILE, sRocket_Fire);
ds_map_add(weapons[6], ROCKET_MAP.COOLDOWN, 50);
ds_map_add(weapons[6], ROCKET_MAP.SPEED, 13);
ds_map_add(weapons[6], ROCKET_MAP.DAMAGE, 1);
ds_map_add(weapons[6], ROCKET_MAP.TIMER, 180);
ds_map_add(weapons[6], ROCKET_MAP.SPECIALS, scRocketSpecialBurnRush);
ds_map_add(weapons[6], ROCKET_MAP.PARTICLE_TRAIL, oParticleHandler.ds_part[? PARTICLES.EMBER]);
ds_map_add(weapons[6], ROCKET_MAP.PARTICLE_EXPLOSION, oParticleHandler.ds_part[? PARTICLES.FIRE2]);
ds_map_add(weapons[6], ROCKET_MAP.BUFF, BUFFTYPE.BURNRUSH);
ds_map_add(weapons[6], ROCKET_MAP.EXPLOSION, sexplosion_Fire);
/*ds_map_add(weapons[6], "specialCollideRocket", scRocketSpecialFire_Rocket);
ds_map_add(weapons[6], "specialCollideWall",scRocketSpecialFire_Wall);
ds_map_add(weapons[6], "specialCollideShootable", scRocketSpecialFire_Shootable);*/


enum ROCKET {
	NONE = 0,
	DEFAULT = 1, 
	FAST = 2,
	HOMING = 3, 
	REVERSE = 4, 
	ICE = 5,
	FIRE = 6
}

enum ROCKET_MAP {
	RECOIL, DAMAGE, PROJECTILE, PROJECTILE_SOUND, COOLDOWN, SPEED, OFFSET, STARTUP, CLIP,
	RELOAD_TIME, SPECIALS, TIMER, IGNORE_WALL, NAME, BUFF, EXPLOSION, PARTICLE_TRAIL, PARTICLE_EXPLOSION
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