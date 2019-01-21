/// @arg default-rocket

current_cd = 0; //Cooldown time between shots
current_delay = -1; //Delay from shooting to deploying rocket
//current_recoil = 0;
current_reload = 0; //Reload time
rockets = 0; //Amount of rockets a player has in the room
ammo = 0;
rocket_scale = 1;
rocket_map = ds_map_create();
rockets_enabled = true; //Ability to shoot rockets
pickups_enabled = true; //Ability to use pickups
scRocketChange(argument0);

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
	RANDOM,
	BOUNCY,
	SPIKED,
	MAGNET,
	OBSOLETE,
	LIGHTNING,
	
	//KEEP LAST
	LENGHT
}

enum ROCKET_SPRITE {
	//Mostly used to save memory on oRocketPickup, or to insta grab a rocket sprite
	NONE = noone, DEFAULT = sRocket_Default, FAST = sRocket_Fast, HOMING = sRocket_Homing, REVERSE = sRocket_Reverse, 
	ICE = sRocket_Ice, FIRE = sRocket_Fire, SAND = sRocket_Sand, LASER = sRocket_Laser, SLIME = sRocket_Slime,
	RANDOM = sRocket_Random, BOUNCY = sRocket_Bouncy, SPIKED = sRocket_Spiked, MAGNET = sRocket_Magnet, OBSOLETE = sRocket_Obsolete,
	LIGHTNING = sRocket_Lightning
}

enum ROCKET_MAP {
	//BASIC VARIABLES
	RECOIL, PROJECTILE, COOLDOWN, SPEED, OFFSET, STARTUP, CLIP, RELOAD_TIME,
	TIMER, IGNORE_WALL, NAME, DESCRIPTION, BUFF, TYPE, ENABLED, SCALE,
	//DAMAGE TYPES
	DAMAGE, DAMAGE_ROCKET, DAMAGE_EXPLOSION,
	//ROCKET EVENTS
	ROCKET_CREATE, ROCKET_STEP, ROCKET_DRAW, ROCKET_DESTROY,
	//PARTICLES
	PARTICLE_TRAIL, PARTICLE_EXPLOSION, PARTICLE_AMT,
	//CAMERA SHAKE
	SHAKE_MAGNITUDE, SHAKE_FRAMES,
	//EXPLOSION SCRIPTS
	EXPLOSION_SPRITE, EXPLOSION_ROCKET, EXPLOSION_WALL, EXPLOSION_SHOOTABLE, EXPLOSION_STEP, EXPLOSION_CREATE,
	EXPLOSION_CREATE_DRAW,
	//SOUND EFFECTS
	SOUND_EXPLOSION, SOUND_SHOOT,
	//ULTIMATE
	ULTIMATE, ULTIMATE_CHARGE_GIVE, ULTIMATE_CHARGE_MULTIPLIER,KBAMT
}